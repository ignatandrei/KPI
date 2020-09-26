
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AboutComponent } from './about/about.component';
import { DashboardComponent } from './dashboard/dashboard.component';



import { dboACTPLComponent } from './WebAPIComponents/dboACTPL.component';

import { dboACTPLAddComponent } from './WebAPIComponents/dboACTPLadd.component';

import { dboACTPLEditComponent } from './WebAPIComponents/dboACTPLedit.component';


import { dboAssVAComponent } from './WebAPIComponents/dboAssVA.component';

import { dboAssVAAddComponent } from './WebAPIComponents/dboAssVAadd.component';

import { dboAssVAEditComponent } from './WebAPIComponents/dboAssVAedit.component';


import { dboAssVAClientsCountiesComponent } from './WebAPIComponents/dboAssVAClientsCounties.component';

import { dboAssVAClientsCountiesAddComponent } from './WebAPIComponents/dboAssVAClientsCountiesadd.component';

import { dboAssVAClientsCountiesEditComponent } from './WebAPIComponents/dboAssVAClientsCountiesedit.component';


import { dboCategoryComponent } from './WebAPIComponents/dboCategory.component';

import { dboCategoryAddComponent } from './WebAPIComponents/dboCategoryadd.component';

import { dboCategoryEditComponent } from './WebAPIComponents/dboCategoryedit.component';


import { dboClientsComponent } from './WebAPIComponents/dboClients.component';

import { dboClientsAddComponent } from './WebAPIComponents/dboClientsadd.component';

import { dboClientsEditComponent } from './WebAPIComponents/dboClientsedit.component';


import { dboClientsCategoryComponent } from './WebAPIComponents/dboClientsCategory.component';

import { dboClientsCategoryAddComponent } from './WebAPIComponents/dboClientsCategoryadd.component';

import { dboClientsCategoryEditComponent } from './WebAPIComponents/dboClientsCategoryedit.component';


import { dboClientsCountiesComponent } from './WebAPIComponents/dboClientsCounties.component';

import { dboClientsCountiesAddComponent } from './WebAPIComponents/dboClientsCountiesadd.component';

import { dboClientsCountiesEditComponent } from './WebAPIComponents/dboClientsCountiesedit.component';


import { dboCountryComponent } from './WebAPIComponents/dboCountry.component';

import { dboCountryAddComponent } from './WebAPIComponents/dboCountryadd.component';

import { dboCountryEditComponent } from './WebAPIComponents/dboCountryedit.component';


import { dboCountyComponent } from './WebAPIComponents/dboCounty.component';

import { dboCountyAddComponent } from './WebAPIComponents/dboCountyadd.component';

import { dboCountyEditComponent } from './WebAPIComponents/dboCountyedit.component';


import { dboKPI11Component } from './WebAPIComponents/dboKPI11.component';

import { dboKPI11AddComponent } from './WebAPIComponents/dboKPI11add.component';

import { dboKPI11EditComponent } from './WebAPIComponents/dboKPI11edit.component';


import { dbovwACTPL_Ass_ClientsComponent } from './WebAPIComponents/dbovwACTPL_Ass_Clients.component';

import { dbovwACTPL_Ass_ClientsAddComponent } from './WebAPIComponents/dbovwACTPL_Ass_Clientsadd.component';

import { dbovwACTPL_Ass_ClientsEditComponent } from './WebAPIComponents/dbovwACTPL_Ass_Clientsedit.component';


import { dbovwAssClientsComponent } from './WebAPIComponents/dbovwAssClients.component';

import { dbovwAssClientsAddComponent } from './WebAPIComponents/dbovwAssClientsadd.component';

import { dbovwAssClientsEditComponent } from './WebAPIComponents/dbovwAssClientsedit.component';


import { dbovwAssManagerComponent } from './WebAPIComponents/dbovwAssManager.component';

import { dbovwAssManagerAddComponent } from './WebAPIComponents/dbovwAssManageradd.component';

import { dbovwAssManagerEditComponent } from './WebAPIComponents/dbovwAssManageredit.component';


import { dbovwClientsBaseComponent } from './WebAPIComponents/dbovwClientsBase.component';

import { dbovwClientsBaseAddComponent } from './WebAPIComponents/dbovwClientsBaseadd.component';

import { dbovwClientsBaseEditComponent } from './WebAPIComponents/dbovwClientsBaseedit.component';


import { dbovwClientsCountryCategoryComponent } from './WebAPIComponents/dbovwClientsCountryCategory.component';

import { dbovwClientsCountryCategoryAddComponent } from './WebAPIComponents/dbovwClientsCountryCategoryadd.component';

import { dbovwClientsCountryCategoryEditComponent } from './WebAPIComponents/dbovwClientsCountryCategoryedit.component';


import { dbovwCountyComponent } from './WebAPIComponents/dbovwCounty.component';

import { dbovwCountyAddComponent } from './WebAPIComponents/dbovwCountyadd.component';

import { dbovwCountyEditComponent } from './WebAPIComponents/dbovwCountyedit.component';



const routes: Routes = [
  { path: 'about', component: AboutComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' },

{ path: 'dboactpl', component: dboACTPLComponent },

{ path: 'dboactpl/add', component: dboACTPLAddComponent },

{ path: 'dboactpl/edit/:id', component: dboACTPLEditComponent },


{ path: 'dboassva', component: dboAssVAComponent },

{ path: 'dboassva/add', component: dboAssVAAddComponent },

{ path: 'dboassva/edit/:id', component: dboAssVAEditComponent },


{ path: 'dboassvaclientscounties', component: dboAssVAClientsCountiesComponent },

{ path: 'dboassvaclientscounties/add', component: dboAssVAClientsCountiesAddComponent },

{ path: 'dboassvaclientscounties/edit/:id', component: dboAssVAClientsCountiesEditComponent },


{ path: 'dbocategory', component: dboCategoryComponent },

{ path: 'dbocategory/add', component: dboCategoryAddComponent },

{ path: 'dbocategory/edit/:id', component: dboCategoryEditComponent },


{ path: 'dboclients', component: dboClientsComponent },

{ path: 'dboclients/add', component: dboClientsAddComponent },

{ path: 'dboclients/edit/:id', component: dboClientsEditComponent },


{ path: 'dboclientscategory', component: dboClientsCategoryComponent },

{ path: 'dboclientscategory/add', component: dboClientsCategoryAddComponent },

{ path: 'dboclientscategory/edit/:id', component: dboClientsCategoryEditComponent },


{ path: 'dboclientscounties', component: dboClientsCountiesComponent },

{ path: 'dboclientscounties/add', component: dboClientsCountiesAddComponent },

{ path: 'dboclientscounties/edit/:id', component: dboClientsCountiesEditComponent },


{ path: 'dbocountry', component: dboCountryComponent },

{ path: 'dbocountry/add', component: dboCountryAddComponent },

{ path: 'dbocountry/edit/:id', component: dboCountryEditComponent },


{ path: 'dbocounty', component: dboCountyComponent },

{ path: 'dbocounty/add', component: dboCountyAddComponent },

{ path: 'dbocounty/edit/:id', component: dboCountyEditComponent },


{ path: 'dbokpi11', component: dboKPI11Component },

{ path: 'dbokpi11/add', component: dboKPI11AddComponent },

{ path: 'dbokpi11/edit/:id', component: dboKPI11EditComponent },


{ path: 'dbovwactpl_ass_clients', component: dbovwACTPL_Ass_ClientsComponent },

{ path: 'dbovwactpl_ass_clients/add', component: dbovwACTPL_Ass_ClientsAddComponent },

{ path: 'dbovwactpl_ass_clients/edit/:id', component: dbovwACTPL_Ass_ClientsEditComponent },


{ path: 'dbovwassclients', component: dbovwAssClientsComponent },

{ path: 'dbovwassclients/add', component: dbovwAssClientsAddComponent },

{ path: 'dbovwassclients/edit/:id', component: dbovwAssClientsEditComponent },


{ path: 'dbovwassmanager', component: dbovwAssManagerComponent },

{ path: 'dbovwassmanager/add', component: dbovwAssManagerAddComponent },

{ path: 'dbovwassmanager/edit/:id', component: dbovwAssManagerEditComponent },


{ path: 'dbovwclientsbase', component: dbovwClientsBaseComponent },

{ path: 'dbovwclientsbase/add', component: dbovwClientsBaseAddComponent },

{ path: 'dbovwclientsbase/edit/:id', component: dbovwClientsBaseEditComponent },


{ path: 'dbovwclientscountrycategory', component: dbovwClientsCountryCategoryComponent },

{ path: 'dbovwclientscountrycategory/add', component: dbovwClientsCountryCategoryAddComponent },

{ path: 'dbovwclientscountrycategory/edit/:id', component: dbovwClientsCountryCategoryEditComponent },


{ path: 'dbovwcounty', component: dbovwCountyComponent },

{ path: 'dbovwcounty/add', component: dbovwCountyAddComponent },

{ path: 'dbovwcounty/edit/:id', component: dbovwCountyEditComponent },

  

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
