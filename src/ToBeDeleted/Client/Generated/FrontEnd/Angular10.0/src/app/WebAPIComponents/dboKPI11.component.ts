import { Component, OnInit, ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { MatTableDataSource } from '@angular/material/table';

import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Title, Meta } from '@angular/platform-browser';

import { dboKPI11, KPI11Graph, Series } from './../WebAPIClasses/dboKPI11';
import { KPI11Data } from './../WebAPIClasses/KPI11Data';
import { dboKPI11Service } from './../services/dboKPI11.service';
import { dboAssVAService } from '../services/dboAssVA.service';
import { dboCountyService } from '../services/dboCounty.service';
import { dboClients } from '../WebAPIClasses/dboClients';
import { dboClientsService } from '../services/dboClients.service';
import { forkJoin } from 'rxjs';
import { SearchKPI11 } from '../WebAPIClasses/SearchKPI11';

@Component({
  selector: 'app-dboKPI11-component',
  templateUrl: './dboKPI11.component.html',
  styleUrls: ['./dboKPI11.component.css'],
})
export class dboKPI11Component implements OnInit {
  //#region chart

  view: any[] = [700, 400];

  // options
  showXAxis = true;
  showYAxis = true;
  gradient = false;
  showLegend = true;
  showXAxisLabel = true;
  xAxisLabel = 'ASS';
  showYAxisLabel = true;
  yAxisLabel = 'YTD';
  legendTitle = ' Actual / Plan YTD';
  colorScheme = {
    domain: ['#5AA454', '#A10A28', '#C7B42C', '#AAAAAA'],
  };
  single: KPI11Graph[] = [];

  //#endregion

  public search: SearchKPI11 = new SearchKPI11();
  public data: KPI11Data = new KPI11Data();
  constructor(
    private mainService: dboKPI11Service,
    private assService: dboAssVAService,
    private countyService: dboCountyService,
    private clientService: dboClientsService,
    private router: Router,
    private titleService: Title,
    private metaService: Meta
  ) {
    this.titleService.setTitle('KPI11');
    this.metaService.addTags([
      { name: 'keywords', content: 'dbo.KPI11' },
      { name: 'description', content: 'List of dbo.KPI11' },
      { name: 'robots', content: 'index, follow' },
    ]);
  }

  public onChangeFilter(): void {
    this.setDataToChart(this.data, this.search);
  }
  ngOnInit(): void {
    const ass = this.assService.GetAll();
    const data = this.mainService.GetAll();
    const clients = this.clientService.GetAll();
    const counties = this.countyService.GetAll();

    forkJoin({ ass, data, clients, counties }).subscribe((it) => {
      this.data = it;
      this.setDataToChart(this.data, this.search);
    });
  }

  setDataToChart(dataSearched: KPI11Data, search: SearchKPI11): void {
    this.single = dataSearched.data
      .filter((it) => {
        if (search.idClient != 0) {
          if (search.idClient != it.idclient) {
            return false;
          }
        }
        if (search.idCounty != 0) {
          if (search.idCounty != it.idcounty) {
            return false;
          }
        }
        return true;
      })
      .map((it) => {
        const s = new KPI11Graph();
        const ass = dataSearched.ass.find((c) => c.idassva === it.idassva);
        s.name = ass.nameassva;
        const plan = new Series();
        plan.name = 'planYTD';
        plan.value = it.planytd;

        const act = new Series();
        act.name = 'actualYTD';
        act.value = it.actualytd;
        s.series = [];
        s.series.push(plan);
        s.series.push(act);

        return s;
      });
  }
}
