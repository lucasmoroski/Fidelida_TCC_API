import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { AuthGuard } from '@fidelity/guards/auth/auth.guard';
import { SplashComponent } from '@fidelity/components/splash/splash.component';
import { AuthComponent } from '@fidelity/components/auth/auth.component';
import { NotFoundComponent } from '@fidelity/components/not-found/not-found.component';
import { DashboardComponent } from '@fidelity/components/dashboard/dashboard.component';
import { ProductComponent } from './components/product/product.component';
import { ProductFormComponent } from './components/product-form/product-form.component';
import { CompanyComponent } from './components/company/company.component';

const ROUTES: Routes = [
  {
    path: '',
    component: SplashComponent
  },
  {
    path: 'auth',
    component: AuthComponent
  },
  {
    path: 'dashboard',
    component: DashboardComponent,
    canActivate: [AuthGuard]
  },
  {
    path: 'company',
    component: CompanyComponent
  },
  {
    path: 'product',
    component: ProductComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'product/:id',
    component: ProductFormComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'product/new',
    component: ProductFormComponent,
    canActivate: [AuthGuard],
  },
  {
    path: 'not-found',
    component: NotFoundComponent
  },
  {
    path: '**',
    redirectTo: 'not-found'
  }
];

@NgModule({
  imports: [RouterModule.forRoot(ROUTES)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
