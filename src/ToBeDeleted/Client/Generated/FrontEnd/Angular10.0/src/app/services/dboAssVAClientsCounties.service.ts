import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboAssVAClientsCounties } from './../WebAPIClasses/dboAssVAClientsCounties';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboAssVAClientsCountiesService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboAssVAClientsCounties/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboAssVAClientsCounties[]>{
    const url = this.baseUrl+'api/dboAssVAClientsCounties/GetAll';
    
    return this.client.get<dboAssVAClientsCounties[]>(url);
  }
  public Get(id:number):Observable<dboAssVAClientsCounties>{
    const url = this.baseUrl+'api/dboAssVAClientsCounties/Get/'+id;
    
    return this.client.get<dboAssVAClientsCounties>(url);
  }
  public Update(data:dboAssVAClientsCounties):Observable<dboAssVAClientsCounties>{
    const url = this.baseUrl+'api/dboAssVAClientsCounties/Put/'+data.idassvaclientscounties;
    
    return this.client.put<dboAssVAClientsCounties>(url,data);
  }
  public Insert(data:dboAssVAClientsCounties):Observable<dboAssVAClientsCounties>{
    const url = this.baseUrl+'api/dboAssVAClientsCounties/Insert/';
    
    return this.client.post<dboAssVAClientsCounties>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/dboAssVAClientsCounties/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
