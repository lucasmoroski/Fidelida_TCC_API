import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Router } from '@angular/router';

import { AuthService } from '@fidelity/services/auth/auth.service';
import { MenuService } from '@fidelity/services/menu/menu.service';
import { MessageService } from '@fidelity/services/message/message.service';
import { IMessage } from '@fidelity/interfaces/message.interface';

@Component({
  selector: 'app-auth',
  templateUrl: './auth.component.html',
  styleUrls: ['./auth.component.scss']
})
export class AuthComponent implements OnInit {

  authForm: FormGroup;

  constructor(
    private menuService: MenuService,
    private formBuilder: FormBuilder,
    private authService: AuthService,
    private router: Router,
    private messageService: MessageService
  ) { }

  ngOnInit(): void {
    this.menuService.displayMenu.next(false);
    this.checkUserIsLogged();
    this.initializeForm();
  }

  checkUserIsLogged(): void {
    if (localStorage.token) {
      this.router.navigate([this.authService.returnUrl || 'dashboard']);
    }
  }

  initializeForm(): void {
    this.authForm = this.formBuilder.group({
      username: [
        '',
        [
          Validators.required,
          Validators.minLength(4)
        ]
      ],
      password: [
        '',
        [
          Validators.required,
          Validators.minLength(4)
        ]
      ]
    });
  }

  onSubmit(): void {
    const username = this.authForm.value.username;
    const password = this.authForm.value.password;
    this.authService.auth(username, password).subscribe(
      () => {
        this.router.navigate(['dashboard']);
        const message: IMessage = {
          context: 'success',
          title: 'Bem vindo!',
          description: 'Autenticado com sucesso',
        };
        this.messageService.addMessage(message);
      },
      () => {
        const message: IMessage = {
          context: 'danger',
          title: 'Não foi possível realizar autenticação!',
          description: 'Usuário e/ou senha incorretos',
        };
        this.messageService.addMessage(message);
      }
    );
  }
}
