import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ SRCkienti } from './../WebAPIClasses/SRCkienti';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class SRCkientiService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }

  public GetAll() : Observable<SRCkienti[]>{
    const url = this.baseUrl+'api/SRCkienti/GetAll';
    
    return this.client.get<SRCkienti[]>(url);
  }
  public Get(id:number):Observable<SRCkienti>{
    const url = this.baseUrl+'api/SRCkienti/Get/'+id;
    
    return this.client.get<SRCkienti>(url);
  }
  public Update(data:SRCkienti):Observable<SRCkienti>{
    const url = this.baseUrl+'api/SRCkienti/Put/'+data.id20200908075449;
    
    return this.client.put<SRCkienti>(url,data);
  }
  public Insert(data:SRCkienti):Observable<SRCkienti>{
    const url = this.baseUrl+'api/SRCkienti/Insert/';
    
    return this.client.post<SRCkienti>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/SRCkienti/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
