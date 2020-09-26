import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboAssVA } from './../WebAPIClasses/dboAssVA';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboAssVAService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboAssVA/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboAssVA[]>{
    const url = this.baseUrl+'api/dboAssVA/GetAll';
    
    return this.client.get<dboAssVA[]>(url);
  }
  public Get(id:number):Observable<dboAssVA>{
    const url = this.baseUrl+'api/dboAssVA/Get/'+id;
    
    return this.client.get<dboAssVA>(url);
  }
  public Update(data:dboAssVA):Observable<dboAssVA>{
    const url = this.baseUrl+'api/dboAssVA/Put/'+data.idassva;
    
    return this.client.put<dboAssVA>(url,data);
  }
  public Insert(data:dboAssVA):Observable<dboAssVA>{
    const url = this.baseUrl+'api/dboAssVA/Insert/';
    
    return this.client.post<dboAssVA>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/dboAssVA/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
