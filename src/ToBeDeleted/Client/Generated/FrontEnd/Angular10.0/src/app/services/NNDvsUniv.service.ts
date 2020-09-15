import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Injectable, Inject } from '@angular/core';
import { Observable } from 'rxjs';
import{ NNDvsUniv } from './../WebAPIClasses/NNDvsUniv';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class NNDvsUnivService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }

  public GetAll() : Observable<NNDvsUniv[]>{
    const url = this.baseUrl+'api/NNDvsUniv/GetAll';
    
    return this.client.get<NNDvsUniv[]>(url);
  }
  public Get(id:number):Observable<NNDvsUniv>{
    const url = this.baseUrl+'api/NNDvsUniv/Get/'+id;
    
    return this.client.get<NNDvsUniv>(url);
  }
  public Update(data:NNDvsUniv):Observable<NNDvsUniv>{
    const url = this.baseUrl+'api/NNDvsUniv/Put/'+data.id20200915075727;
    
    return this.client.put<NNDvsUniv>(url,data);
  }
  public Insert(data:NNDvsUniv):Observable<NNDvsUniv>{
    const url = this.baseUrl+'api/NNDvsUniv/Insert/';
    
    return this.client.post<NNDvsUniv>(url,data);
  }
  public Delete(id:number):Observable<number>{
    const url = this.baseUrl+'api/NNDvsUniv/Delete/'+id;
    
    return this.client.delete<number>(url);
  }
  
}
