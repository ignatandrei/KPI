import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboClientsCounties } from './../WebAPIClasses/dboClientsCounties';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboClientsCountiesService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboClientsCounties/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboClientsCounties[]>{
    const url = this.baseUrl+'api/dboClientsCounties/GetAll';
    
    return this.client.get<dboClientsCounties[]>(url);
  }
  public Get(id:number):Observable<dboClientsCounties>{
    const url = this.baseUrl+'api/dboClientsCounties/Get/'+id;
    
    return this.client.get<dboClientsCounties>(url);
  }
  public Update(data:dboClientsCounties):Observable<dboClientsCounties>{
    const url = this.baseUrl+'api/dboClientsCounties/Put/'+data.idclientscounties;
    
    return this.client.put<dboClientsCounties>(url,data);
  }
  public Insert(data:dboClientsCounties):Observable<dboClientsCounties>{
    const url = this.baseUrl+'api/dboClientsCounties/Insert/';
    
    return this.client.post<dboClientsCounties>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/dboClientsCounties/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
