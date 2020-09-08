import { Component, OnInit } from '@angular/core';
import {KPIService, KPI_SR }from './../services/kpi.service';
class KV{
  constructor(public name: string, public value: number){

  }
}

@Component({
  selector: 'app-kpi',
  templateUrl: './kpi.component.html',
  styleUrls: ['./kpi.component.css']
})
export class KPIComponent implements OnInit {

  //#region chart
  single: KV[] = [];
  multi: any[];

  view: any[] = [700, 400];

  // options
  showXAxis = true;
  showYAxis = true;
  gradient = false;
  showLegend = true;
  showXAxisLabel = true;
  xAxisLabel = 'SR';
  showYAxisLabel = true;
  yAxisLabel = 'Percent';

  colorScheme = {
    domain: ['#5AA454', '#A10A28', '#C7B42C', '#AAAAAA']
  };
  //#endregion
  public kpiSR: KPI_SR[];
  constructor(private kpi: KPIService) { }

  ngOnInit(): void {
    this.kpi.SRValVindutaVsPlan().subscribe(it => {
      this.kpiSR = it.sort((a, b) => b.vindutVsPlan - a.vindutVsPlan);
      this.single = this.kpiSR.map(it => new KV(it.name, (it.vindutVsPlan *100).toFixed(2)));

    });
  }

  //#region  allcharts
  onSelect(data): void {
    console.log('Item clicked', JSON.parse(JSON.stringify(data)));
  }

  onActivate(data): void {
    console.log('Activate', JSON.parse(JSON.stringify(data)));
  }

  onDeactivate(data): void {
    console.log('Deactivate', JSON.parse(JSON.stringify(data)));
  }
  //#endregion

}
