import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ SalesRep } from './../WebAPIClasses/SalesRep';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class SalesRepService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }

  public GetAll() : Observable<SalesRep[]>{
    const url = this.baseUrl+'api/SalesRep/GetAll';
    
    return this.client.get<SalesRep[]>(url);
  }
  public Get(id:number):Observable<SalesRep>{
    const url = this.baseUrl+'api/SalesRep/Get/'+id;
    
    return this.client.get<SalesRep>(url);
  }
  public Update(data:SalesRep):Observable<SalesRep>{
    const url = this.baseUrl+'api/SalesRep/Put/'+data.id20200908075449;
    
    return this.client.put<SalesRep>(url,data);
  }
  public Insert(data:SalesRep):Observable<SalesRep>{
    const url = this.baseUrl+'api/SalesRep/Insert/';
    
    return this.client.post<SalesRep>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/SalesRep/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
