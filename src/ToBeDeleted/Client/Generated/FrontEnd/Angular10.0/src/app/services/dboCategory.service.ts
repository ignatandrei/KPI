import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboCategory } from './../WebAPIClasses/dboCategory';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboCategoryService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboCategory/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboCategory[]>{
    const url = this.baseUrl+'api/dboCategory/GetAll';
    
    return this.client.get<dboCategory[]>(url);
  }
  public Get(id:number):Observable<dboCategory>{
    const url = this.baseUrl+'api/dboCategory/Get/'+id;
    
    return this.client.get<dboCategory>(url);
  }
  public Update(data:dboCategory):Observable<dboCategory>{
    const url = this.baseUrl+'api/dboCategory/Put/'+data.idcategory;
    
    return this.client.put<dboCategory>(url,data);
  }
  public Insert(data:dboCategory):Observable<dboCategory>{
    const url = this.baseUrl+'api/dboCategory/Insert/';
    
    return this.client.post<dboCategory>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/dboCategory/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
