import { Injectable, Inject } from '@angular/core';
import { environment } from './../../environments/environment';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { APP_BASE_HREF } from '@angular/common';
@Injectable({
  providedIn: 'root'
})
export class KPIService {

  baseUrl: string;
  constructor(@Inject(APP_BASE_HREF) baseHref: string, private client: HttpClient) { 
    this.baseUrl = environment.webAPIUrl + baseHref ;
    console.log(environment.webAPIUrl );
    console.log(baseHref);
    console.log(this.baseUrl);
    

  }
  public SRValVindutaVsPlan() : Observable<KPI_SR[]>{
    const url = this.baseUrl+'api/kpi/SRValVindutaVsPlan';
    
    return this.client.get<KPI_SR[]>(url);
  }


}

export class KPI_SR{
  public name: string;
  public valoareTotalaVinduta: number;
  public valoarePlanTotala: number;
  public vindutVsPlan: number;
}
