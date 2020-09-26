import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dbovwAssManager } from './../WebAPIClasses/dbovwAssManager';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dbovwAssManagerService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dbovwAssManager/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dbovwAssManager[]>{
    const url = this.baseUrl+'api/dbovwAssManager/GetAll';
    
    return this.client.get<dbovwAssManager[]>(url);
  }

      }
    
      