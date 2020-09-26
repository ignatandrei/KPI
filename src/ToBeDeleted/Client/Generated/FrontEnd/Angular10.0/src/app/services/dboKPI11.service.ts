import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dboKPI11 } from './../WebAPIClasses/dboKPI11';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dboKPI11Service {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dboKPI11/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dboKPI11[]>{
    const url = this.baseUrl+'api/dboKPI11/GetAll';
    
    return this.client.get<dboKPI11[]>(url);
  }

      }
    
      