import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboCounty } from './../WebAPIClasses/dboCounty';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboCountyService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboCounty/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboCounty[]>{
    const url = this.baseUrl+'api/dboCounty/GetAll';
    
    return this.client.get<dboCounty[]>(url);
  }
  public Get(id:number):Observable<dboCounty>{
    const url = this.baseUrl+'api/dboCounty/Get/'+id;
    
    return this.client.get<dboCounty>(url);
  }
  public Update(data:dboCounty):Observable<dboCounty>{
    const url = this.baseUrl+'api/dboCounty/Put/'+data.idcounty;
    
    return this.client.put<dboCounty>(url,data);
  }
  public Insert(data:dboCounty):Observable<dboCounty>{
    const url = this.baseUrl+'api/dboCounty/Insert/';
    
    return this.client.post<dboCounty>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/dboCounty/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
