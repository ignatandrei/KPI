import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dbovwCounty } from './../WebAPIClasses/dbovwCounty';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dbovwCountyService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dbovwCounty/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dbovwCounty[]>{
    const url = this.baseUrl+'api/dbovwCounty/GetAll';
    
    return this.client.get<dbovwCounty[]>(url);
  }

      }
    
      