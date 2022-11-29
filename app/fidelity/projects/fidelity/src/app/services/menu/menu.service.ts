import { Injectable } from '@angular/core';

import { Observable, of, Subject } from 'rxjs';

import { IMenu } from '@fidelity/interfaces/menu.interface';

@Injectable({
  providedIn: 'root'
})
export class MenuService {

  public displayMenu: Subject<boolean> = new Subject<boolean>();
  public pageTitle: Subject<string> = new Subject<string>();

  constructor() {
    this.displayMenu.next(true);
  }

  getMenus(): Observable<IMenu[]> {
    const menus: IMenu[] = [
      {
        name: 'Dashboard',
        icon: 'insert_chart_outlined',
        link: '/dashboard',
      },
      {
        name: 'Produtos',
        icon: 'fastfood',
        link: '/product',
      },
    ];

    return of(menus);
  }
}
