import { Component, OnInit, ViewChild } from '@angular/core';
import { BreakpointObserver, Breakpoints } from '@angular/cdk/layout';

import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';
import { Router } from '@angular/router';

import { Observable } from 'rxjs';
import { map, shareReplay } from 'rxjs/operators';

import { IProduct } from '@fidelity/interfaces/product.interface';
import { MenuService } from '@fidelity/services/menu/menu.service';
import { ProductService } from '@fidelity/services/product/product.service';

@Component({
  selector: 'app-product',
  templateUrl: './product.component.html',
  styleUrls: ['./product.component.scss']
})
export class ProductComponent implements OnInit {

  @ViewChild(MatPaginator)
  paginator: MatPaginator;

  @ViewChild(MatSort)
  sort: MatSort;

  isHandset$: Observable<boolean> = this.breakpointObserver
    .observe(Breakpoints.Handset)
    .pipe(
      map(result => result.matches),
      shareReplay()
    );

  columns: string[];
  loading: boolean;
  dataSource: MatTableDataSource<IProduct>;
  dataSourceLength: number;

  constructor(
    private menuService: MenuService,
    private productService: ProductService,
    private breakpointObserver: BreakpointObserver,
    private router: Router
  ) { }

  ngOnInit(): void {
    this.menuService.pageTitle.next('Produtos');
    this.menuService.displayMenu.next(true);
    this.loadProducts();
  }

  loadProducts(): void {
    this.loading = true;
    this.productService.getProducts(1).subscribe((products: IProduct[]) => {
      this.loading = false;
      this.dataSourceLength = products.length;
      this.dataSource = new MatTableDataSource<IProduct>(products);
      this.dataSource.paginator = this.paginator;
      this.dataSource.sort = this.sort;
      this.isHandset$.subscribe((handset: boolean) => {
        this.columns = handset
          ? ['id', 'name']
          : ['id', 'name', 'value', 'category', 'active'];
      });
    });
  }

  filterProducts(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();
    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

  newProduct(): void {
    this.router.navigate(['product', 'new']);
  }

  selectProduct(productId: number): void {
    this.router.navigate(['product', productId]);
  }

}
