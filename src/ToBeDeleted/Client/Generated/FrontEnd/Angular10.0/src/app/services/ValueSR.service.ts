import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ ValueSR } from './../WebAPIClasses/ValueSR';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class ValueSRService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }

  public GetAll() : Observable<ValueSR[]>{
    const url = this.baseUrl+'api/ValueSR/GetAll';
    
    return this.client.get<ValueSR[]>(url);
  }
  public Get(id:number):Observable<ValueSR>{
    const url = this.baseUrl+'api/ValueSR/Get/'+id;
    
    return this.client.get<ValueSR>(url);
  }
  public Update(data:ValueSR):Observable<ValueSR>{
    const url = this.baseUrl+'api/ValueSR/Put/'+data.id20200908075619;
    
    return this.client.put<ValueSR>(url,data);
  }
  public Insert(data:ValueSR):Observable<ValueSR>{
    const url = this.baseUrl+'api/ValueSR/Insert/';
    
    return this.client.post<ValueSR>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/ValueSR/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
