import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboClientsCategory } from './../WebAPIClasses/dboClientsCategory';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboClientsCategoryService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboClientsCategory/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboClientsCategory[]>{
    const url = this.baseUrl+'api/dboClientsCategory/GetAll';
    
    return this.client.get<dboClientsCategory[]>(url);
  }
  public Get(id:number):Observable<dboClientsCategory>{
    const url = this.baseUrl+'api/dboClientsCategory/Get/'+id;
    
    return this.client.get<dboClientsCategory>(url);
  }
  public Update(data:dboClientsCategory):Observable<dboClientsCategory>{
    const url = this.baseUrl+'api/dboClientsCategory/Put/'+data.id;
    
    return this.client.put<dboClientsCategory>(url,data);
  }
  public Insert(data:dboClientsCategory):Observable<dboClientsCategory>{
    const url = this.baseUrl+'api/dboClientsCategory/Insert/';
    
    return this.client.post<dboClientsCategory>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/dboClientsCategory/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
