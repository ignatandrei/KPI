import { Title, Meta } from '@angular/platform-browser';
import { Component, OnInit } from '@angular/core';

import { dboACTPLService } from '../services/dboACTPL.service';

import { dboAssVAService } from '../services/dboAssVA.service';

import { dboAssVAClientsCountiesService } from '../services/dboAssVAClientsCounties.service';

import { dboCategoryService } from '../services/dboCategory.service';

import { dboClientsService } from '../services/dboClients.service';

import { dboClientsCategoryService } from '../services/dboClientsCategory.service';

import { dboClientsCountiesService } from '../services/dboClientsCounties.service';

import { dboCountryService } from '../services/dboCountry.service';

import { dboCountyService } from '../services/dboCounty.service';

import { dboKPI11Service } from '../services/dboKPI11.service';

import { dbovwACTPL_Ass_ClientsService } from '../services/dbovwACTPL_Ass_Clients.service';

import { dbovwAssClientsService } from '../services/dbovwAssClients.service';

import { dbovwAssManagerService } from '../services/dbovwAssManager.service';

import { dbovwClientsBaseService } from '../services/dbovwClientsBase.service';

import { dbovwClientsCountryCategoryService } from '../services/dbovwClientsCountryCategory.service';

import { dbovwCountyService } from '../services/dbovwCounty.service';
@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {


  public numberRecordsdboactpl: number;
  
  public numberRecordsdboassva: number;
  
  public numberRecordsdboassvaclientscounties: number;
  
  public numberRecordsdbocategory: number;
  
  public numberRecordsdboclients: number;
  
  public numberRecordsdboclientscategory: number;
  
  public numberRecordsdboclientscounties: number;
  
  public numberRecordsdbocountry: number;
  
  public numberRecordsdbocounty: number;
  
  public numberRecordsdbokpi11: number;
  
  public numberRecordsdbovwactpl_ass_clients: number;
  
  public numberRecordsdbovwassclients: number;
  
  public numberRecordsdbovwassmanager: number;
  
  public numberRecordsdbovwclientsbase: number;
  
  public numberRecordsdbovwclientscountrycategory: number;
  
  public numberRecordsdbovwcounty: number;
    
  constructor(private titleService: Title, private metaService: Meta    , private dboactplService:dboACTPLService , private dboassvaService:dboAssVAService , private dboassvaclientscountiesService:dboAssVAClientsCountiesService , private dbocategoryService:dboCategoryService , private dboclientsService:dboClientsService , private dboclientscategoryService:dboClientsCategoryService , private dboclientscountiesService:dboClientsCountiesService , private dbocountryService:dboCountryService , private dbocountyService:dboCountyService , private dbokpi11Service:dboKPI11Service , private dbovwactpl_ass_clientsService:dbovwACTPL_Ass_ClientsService , private dbovwassclientsService:dbovwAssClientsService , private dbovwassmanagerService:dbovwAssManagerService , private dbovwclientsbaseService:dbovwClientsBaseService , private dbovwclientscountrycategoryService:dbovwClientsCountryCategoryService , private dbovwcountyService:dbovwCountyService) {
       this.titleService.setTitle('Main dashboard');
      this.metaService.addTags([
        {name: 'keywords', content: 'dashboard'},
        {name: 'description', content: 'dashboard'},
        {name: 'robots', content: 'index, follow'}
      ]);

   }

  ngOnInit(): void {


      this.dboactplService.Count().subscribe(it=> this.numberRecordsdboactpl=it);      
      
      this.dboassvaService.Count().subscribe(it=> this.numberRecordsdboassva=it);      
      
      this.dboassvaclientscountiesService.Count().subscribe(it=> this.numberRecordsdboassvaclientscounties=it);      
      
      this.dbocategoryService.Count().subscribe(it=> this.numberRecordsdbocategory=it);      
      
      this.dboclientsService.Count().subscribe(it=> this.numberRecordsdboclients=it);      
      
      this.dboclientscategoryService.Count().subscribe(it=> this.numberRecordsdboclientscategory=it);      
      
      this.dboclientscountiesService.Count().subscribe(it=> this.numberRecordsdboclientscounties=it);      
      
      this.dbocountryService.Count().subscribe(it=> this.numberRecordsdbocountry=it);      
      
      this.dbocountyService.Count().subscribe(it=> this.numberRecordsdbocounty=it);      
      
      this.dbokpi11Service.Count().subscribe(it=> this.numberRecordsdbokpi11=it);      
      
      this.dbovwactpl_ass_clientsService.Count().subscribe(it=> this.numberRecordsdbovwactpl_ass_clients=it);      
      
      this.dbovwassclientsService.Count().subscribe(it=> this.numberRecordsdbovwassclients=it);      
      
      this.dbovwassmanagerService.Count().subscribe(it=> this.numberRecordsdbovwassmanager=it);      
      
      this.dbovwclientsbaseService.Count().subscribe(it=> this.numberRecordsdbovwclientsbase=it);      
      
      this.dbovwclientscountrycategoryService.Count().subscribe(it=> this.numberRecordsdbovwclientscountrycategory=it);      
      
      this.dbovwcountyService.Count().subscribe(it=> this.numberRecordsdbovwcounty=it);      
      
    
  }

}
