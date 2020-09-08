import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ CifreAnuale } from './../WebAPIClasses/CifreAnuale';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class CifreAnualeService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }

  public GetAll() : Observable<CifreAnuale[]>{
    const url = this.baseUrl+'api/CifreAnuale/GetAll';
    
    return this.client.get<CifreAnuale[]>(url);
  }
  public Get(id:number):Observable<CifreAnuale>{
    const url = this.baseUrl+'api/CifreAnuale/Get/'+id;
    
    return this.client.get<CifreAnuale>(url);
  }
  public Update(data:CifreAnuale):Observable<CifreAnuale>{
    const url = this.baseUrl+'api/CifreAnuale/Put/'+data.id20200908075419;
    
    return this.client.put<CifreAnuale>(url,data);
  }
  public Insert(data:CifreAnuale):Observable<CifreAnuale>{
    const url = this.baseUrl+'api/CifreAnuale/Insert/';
    
    return this.client.post<CifreAnuale>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/CifreAnuale/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
