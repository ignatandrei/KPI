import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboCountry } from './../WebAPIClasses/dboCountry';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboCountryService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboCountry/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboCountry[]>{
    const url = this.baseUrl+'api/dboCountry/GetAll';
    
    return this.client.get<dboCountry[]>(url);
  }
  public Get(id:number):Observable<dboCountry>{
    const url = this.baseUrl+'api/dboCountry/Get/'+id;
    
    return this.client.get<dboCountry>(url);
  }
  public Update(data:dboCountry):Observable<dboCountry>{
    const url = this.baseUrl+'api/dboCountry/Put/'+data.idcountry;
    
    return this.client.put<dboCountry>(url,data);
  }
  public Insert(data:dboCountry):Observable<dboCountry>{
    const url = this.baseUrl+'api/dboCountry/Insert/';
    
    return this.client.post<dboCountry>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/dboCountry/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
