import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ dbovwACTPL_Ass_Clients } from './../WebAPIClasses/dbovwACTPL_Ass_Clients';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class dbovwACTPL_Ass_ClientsService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public Count() : Observable<number>{
    const url = this.baseUrl+'api/dbovwACTPL_Ass_Clients/Count';
    
    return this.client.get<number>(url);
  }
  public GetAll() : Observable<dbovwACTPL_Ass_Clients[]>{
    const url = this.baseUrl+'api/dbovwACTPL_Ass_Clients/GetAll';
    
    return this.client.get<dbovwACTPL_Ass_Clients[]>(url);
  }

      }
    
      