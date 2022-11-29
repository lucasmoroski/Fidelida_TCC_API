import { Component, OnInit } from '@angular/core';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';
import { MatDialog } from '@angular/material/dialog';

import { Observable } from 'rxjs';
import { map, shareReplay } from 'rxjs/operators';

import { IMenu } from '@fidelity/interfaces/menu.interface';
import { MenuService } from '@fidelity/services/menu/menu.service';
import { AuthService } from '@fidelity/services/auth/auth.service';
import { IUser } from '@fidelity/interfaces/user.interface';
import { LogoutComponent } from '@fidelity/components/logout/logout.component';

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent implements OnInit {

  displayMenu: boolean;
  pageTitle: string;
  menus: IMenu[];
  user: IUser;

  isHandset$: Observable<boolean> = this.breakpointObserver
    .observe(Breakpoints.Handset)
    .pipe(
      map(result => result.matches),
      shareReplay()
    );

  constructor(
    private breakpointObserver: BreakpointObserver,
    private menuService: MenuService,
    private authService: AuthService,
    private dialog: MatDialog
  ) { }

  ngOnInit(): void {
    this.buildMenu();
  }

  buildMenu(): void {
    this.menuService.displayMenu.subscribe((display: boolean) => this.displayMenu = display);
    this.menuService.pageTitle.subscribe((title: string) => this.pageTitle = title);
    this.menuService.getMenus().subscribe((menus: IMenu[]) => this.menus = menus);
    this.authService.getLoggedUserData().subscribe((user: IUser) => this.user = user);
  }

  openLogoutComponent(): void {
    this.dialog.open(LogoutComponent);
  }

}
