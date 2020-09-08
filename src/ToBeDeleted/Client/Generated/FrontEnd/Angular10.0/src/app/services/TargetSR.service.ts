import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ TargetSR } from './../WebAPIClasses/TargetSR';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class TargetSRService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }

  public GetAll() : Observable<TargetSR[]>{
    const url = this.baseUrl+'api/TargetSR/GetAll';
    
    return this.client.get<TargetSR[]>(url);
  }
  public Get(id:number):Observable<TargetSR>{
    const url = this.baseUrl+'api/TargetSR/Get/'+id;
    
    return this.client.get<TargetSR>(url);
  }
  public Update(data:TargetSR):Observable<TargetSR>{
    const url = this.baseUrl+'api/TargetSR/Put/'+data.id20200908075619;
    
    return this.client.put<TargetSR>(url,data);
  }
  public Insert(data:TargetSR):Observable<TargetSR>{
    const url = this.baseUrl+'api/TargetSR/Insert/';
    
    return this.client.post<TargetSR>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/TargetSR/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
