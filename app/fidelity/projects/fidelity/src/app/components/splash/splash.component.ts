import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

import { MenuService } from '@fidelity/services/menu/menu.service';

@Component({
  selector: 'app-splash',
  templateUrl: './splash.component.html',
  styleUrls: ['./splash.component.scss']
})
export class SplashComponent implements OnInit {

  constructor(
    private menuService: MenuService,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.menuService.displayMenu.next(false);
    setTimeout(() => {
      this.router.navigate(['auth']);
    }, 3000);
  }

}
