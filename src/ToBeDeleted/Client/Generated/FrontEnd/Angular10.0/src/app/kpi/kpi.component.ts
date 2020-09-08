import { Component, OnInit } from '@angular/core';
import {KPIService, KPI_SR }from './../services/kpi.service';
@Component({
  selector: 'app-kpi',
  templateUrl: './kpi.component.html',
  styleUrls: ['./kpi.component.css']
})
export class KPIComponent implements OnInit {

  public kpiSR: KPI_SR[];
  constructor(private kpi: KPIService) { }

  ngOnInit(): void {
    this.kpi.SRValVindutaVsPlan().subscribe(it=>{
      this.kpiSR =it.sort((a,b)=>b.vindutVsPlan - a.vindutVsPlan);
    })
  }

}
