import { BrowserModule } from '@angular/platform-browser';
import { CUSTOM_ELEMENTS_SCHEMA, NgModule } from '@angular/core';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { ServiceWorkerModule } from '@angular/service-worker';
import { ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';

import { LayoutModule } from '@angular/cdk/layout';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatButtonModule } from '@angular/material/button';
import { MatCheckboxModule } from '@angular/material/checkbox';
import { MatDividerModule } from '@angular/material/divider';
import { MatCardModule } from '@angular/material/card';
import { MatSidenavModule } from '@angular/material/sidenav';
import { MatToolbarModule } from '@angular/material/toolbar';
import { MatListModule } from '@angular/material/list';
import { MatDialogModule } from '@angular/material/dialog';
import { MatTableModule } from '@angular/material/table';
import { MatSortModule } from '@angular/material/sort';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatPaginatorModule, MatPaginatorIntl } from '@angular/material/paginator';
import { MatSelectModule } from '@angular/material/select';
import { MatSlideToggleModule } from '@angular/material/slide-toggle';
import { MatProgressBarModule } from '@angular/material/progress-bar';
import { MatStepperModule } from '@angular/material/stepper';

import { NgxMaskModule } from 'ngx-mask';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { environment } from '@fidelity/environments/environment';
import { RequestInterceptor } from '@fidelity/services/interceptor/request.interceptor';
import { AuthComponent } from '@fidelity/components/auth/auth.component';
import { NotFoundComponent } from '@fidelity/components/not-found/not-found.component';
import { SplashComponent } from '@fidelity/components/splash/splash.component';
import { MessageComponent } from '@fidelity/components/message/message.component';
import { DashboardComponent } from '@fidelity/components/dashboard/dashboard.component';
import { MenuComponent } from '@fidelity/components/menu/menu.component';
import { LogoutComponent } from '@fidelity/components/logout/logout.component';
import { ProductComponent } from '@fidelity/components/product/product.component';
import { portuguesePaginatorIntl } from '@fidelity/components/paginator-initl/paginator-initl';
import { ProductFormComponent } from '@fidelity/components/product-form/product-form.component';
import { RegisterComponent } from './components/register/register.component';
import { CompanyComponent } from './components/company/company.component';

@NgModule({
  declarations: [
    AppComponent,
    AuthComponent,
    NotFoundComponent,
    SplashComponent,
    MessageComponent,
    DashboardComponent,
    MenuComponent,
    LogoutComponent,
    ProductComponent,
    ProductFormComponent,
    RegisterComponent,
    CompanyComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    ServiceWorkerModule.register(
      'ngsw-worker.js',
      { enabled: environment.production }
    ),
    ReactiveFormsModule,
    HttpClientModule,
    LayoutModule,
    MatIconModule,
    MatInputModule,
    MatFormFieldModule,
    MatButtonModule,
    MatCheckboxModule,
    MatDividerModule,
    MatCardModule,
    MatSidenavModule,
    MatToolbarModule,
    MatListModule,
    MatDialogModule,
    MatTableModule,
    MatSortModule,
    MatPaginatorModule,
    MatProgressSpinnerModule,
    MatSelectModule,
    MatStepperModule,
    NgxMaskModule.forRoot(),
    MatSlideToggleModule,
    MatProgressBarModule
  ],
  schemas: [CUSTOM_ELEMENTS_SCHEMA],
  providers: [
    {
      provide: HTTP_INTERCEPTORS,
      useClass: RequestInterceptor,
      multi: true
    },
    {
      provide: MatPaginatorIntl,
      useValue: portuguesePaginatorIntl()
    },
    RequestInterceptor
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
