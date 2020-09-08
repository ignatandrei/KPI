import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ Client } from './../WebAPIClasses/Client';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class ClientService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }

  public GetAll() : Observable<Client[]>{
    const url = this.baseUrl+'api/Client/GetAll';
    
    return this.client.get<Client[]>(url);
  }
  public Get(id:number):Observable<Client>{
    const url = this.baseUrl+'api/Client/Get/'+id;
    
    return this.client.get<Client>(url);
  }
  public Update(data:Client):Observable<Client>{
    const url = this.baseUrl+'api/Client/Put/'+data.id20200908075419;
    
    return this.client.put<Client>(url,data);
  }
  public Insert(data:Client):Observable<Client>{
    const url = this.baseUrl+'api/Client/Insert/';
    
    return this.client.post<Client>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/Client/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
