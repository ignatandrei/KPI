import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboACTPL } from './../WebAPIClasses/dboACTPL';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboACTPLService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboACTPL/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboACTPL[]>{
    const url = this.baseUrl+'api/dboACTPL/GetAll';
    
    return this.client.get<dboACTPL[]>(url);
  }
  public Get(id:number):Observable<dboACTPL>{
    const url = this.baseUrl+'api/dboACTPL/Get/'+id;
    
    return this.client.get<dboACTPL>(url);
  }
  public Update(data:dboACTPL):Observable<dboACTPL>{
    const url = this.baseUrl+'api/dboACTPL/Put/'+data.idactpl;
    
    return this.client.put<dboACTPL>(url,data);
  }
  public Insert(data:dboACTPL):Observable<dboACTPL>{
    const url = this.baseUrl+'api/dboACTPL/Insert/';
    
    return this.client.post<dboACTPL>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/dboACTPL/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
