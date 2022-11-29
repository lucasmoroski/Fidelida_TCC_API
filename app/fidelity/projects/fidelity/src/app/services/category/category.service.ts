import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { Observable } from 'rxjs';

import { environment } from '@fidelity/environments/environment';
import { ICategory } from '@fidelity/interfaces/category.interface';

@Injectable({
  providedIn: 'root'
})
export class CategoryService {

  private apiUrl: string = environment.apiUrl;

  constructor(
    private http: HttpClient
  ) { }

  getCategories(companyId: number): Observable<ICategory[]> {
    const url = `${this.apiUrl}/company/${companyId}/category`;

    return this.http.get<ICategory[]>(url);
  }

}
