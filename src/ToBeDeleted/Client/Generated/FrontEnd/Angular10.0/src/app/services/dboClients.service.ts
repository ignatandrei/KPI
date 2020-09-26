import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboClients } from './../WebAPIClasses/dboClients';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboClientsService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboClients/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboClients[]>{
    const url = this.baseUrl+'api/dboClients/GetAll';
    
    return this.client.get<dboClients[]>(url);
  }
  public Get(id:number):Observable<dboClients>{
    const url = this.baseUrl+'api/dboClients/Get/'+id;
    
    return this.client.get<dboClients>(url);
  }
  public Update(data:dboClients):Observable<dboClients>{
    const url = this.baseUrl+'api/dboClients/Put/'+data.idclient;
    
    return this.client.put<dboClients>(url,data);
  }
  public Insert(data:dboClients):Observable<dboClients>{
    const url = this.baseUrl+'api/dboClients/Insert/';
    
    return this.client.post<dboClients>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/dboClients/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
