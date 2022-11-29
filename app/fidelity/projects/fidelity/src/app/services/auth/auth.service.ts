import { Injectable } from '@angular/core';
import { HttpClient, HttpErrorResponse, HttpHeaders, HttpResponse } from '@angular/common/http';
import { Router } from '@angular/router';

import { Observable, of } from 'rxjs';
import { map } from 'rxjs/operators';

import { environment } from '@fidelity/environments/environment';
import { IUser } from '@fidelity/interfaces/user.interface';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  public returnUrl = '';
  private apiUrl: string = environment.apiUrl;

  constructor(
    private http: HttpClient,
    private router: Router
  ) { }

  public auth(username: string, password: string): Observable<boolean> {
    const url = `${this.apiUrl}/auth`;
    const parameters = JSON.stringify({ username, password });
    const headers = new HttpHeaders().set('Content-Type', 'application/json');

    const observable: Observable<HttpResponse<IUser>> = this.http.post<IUser>(
      url,
      parameters,
      { headers, observe: 'response' }
    );

    observable.subscribe(
      (response: HttpResponse<IUser>) => {
        localStorage.token = response.body.token;
        localStorage.userId = response.body.id;
        localStorage.userName = response.body.name;
        localStorage.userPhoto = response.body.photo;
        localStorage.userCompanyId = response.body.companyId;
      },
      (error: HttpErrorResponse) => error
    );

    const authentication: Observable<boolean> = observable.pipe(
      map((response: HttpResponse<IUser>) => response.status === 200)
    );

    return authentication;
  }

  public logout(): void {
    localStorage.removeItem('token');
    localStorage.removeItem('userId');
    localStorage.removeItem('userName');
    localStorage.removeItem('userPhoto');
    localStorage.removeItem('userCompanyId');
    this.router.navigate(['/']);
  }

  public getLoggedUserData(): Observable<IUser> {
    const user: IUser = {
      id: localStorage.userId,
      name: localStorage.userName,
      photo: localStorage.userPhoto,
      companyId: localStorage.userCompanyId
    };
    return of(user);
  }
}
