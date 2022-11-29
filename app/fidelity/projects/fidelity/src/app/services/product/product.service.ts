import { Injectable } from '@angular/core';
import { HttpClient, HttpEvent, HttpHeaders, HttpResponse } from '@angular/common/http';

import { Observable } from 'rxjs';
import { v4 as uuidv4 } from 'uuid';

import { environment } from '@fidelity/environments/environment';
import { IProduct } from '@fidelity/interfaces/product.interface';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  private apiUrl: string = environment.apiUrl;

  constructor(
    private http: HttpClient
  ) { }

  buildProduct(): IProduct {
    return {
      id: null,
      name: null,
      companyId: null,
      category: {
        id: null,
        companyId: null,
        name: null
      },
      value: null,
      fidelities: null,
      photo: null,
      description: null,
      active: null
    };
  }

  getProducts(companyId: number): Observable<IProduct[]> {
    const url = `${this.apiUrl}/company/${companyId}/product`;

    return this.http.get<IProduct[]>(url);
  }

  getProduct(companyId: number, productId: number): Observable<IProduct> {
    const url = `${this.apiUrl}/company/${companyId}/product/${productId}`;

    return this.http.get<IProduct>(url);
  }

  updateProduct(product: IProduct): Observable<HttpResponse<any>> {
    const url = `${this.apiUrl}/company/${product.companyId}/product/${product.id}`;
    const parameters = JSON.stringify({ product });
    const headers = new HttpHeaders().set('Content-Type', 'application/json');

    return this.http.put(url, parameters, { headers, observe: 'response' });
  }

  createProduct(product: IProduct): Observable<HttpResponse<any>> {
    const url = `${this.apiUrl}/company/${product.companyId}/product/new`;
    const parameters = JSON.stringify({ product });
    const headers = new HttpHeaders().set('Content-Type', 'application/json');

    return this.http.post(url, parameters, { headers, observe: 'response' });
  }

  uploadProductPhoto(companyId: number, file: File): Observable<HttpEvent<Object>> {
    const url = `${this.apiUrl}/company/${companyId}/product/upload`;
    const formData: FormData = new FormData();
    formData.append('image', file, `product-${uuidv4()}`);

    return this.http.post(
      url,
      formData,
      { reportProgress: true, observe: 'events' }
    );
  }
}
