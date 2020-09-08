
import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AboutComponent } from './about/about.component';
import { DashboardComponent } from './dashboard/dashboard.component';



import { ClientComponent } from './WebAPIComponents/Client.component';

import { ClientAddComponent } from './WebAPIComponents/Clientadd.component';

import { ClientEditComponent } from './WebAPIComponents/Clientedit.component';


import { CifreAnualeComponent } from './WebAPIComponents/CifreAnuale.component';

import { CifreAnualeAddComponent } from './WebAPIComponents/CifreAnualeadd.component';

import { CifreAnualeEditComponent } from './WebAPIComponents/CifreAnualeedit.component';

import { SalesRepComponent } from './WebAPIComponents/SalesRep.component';

import { SalesRepAddComponent } from './WebAPIComponents/SalesRepadd.component';

import { SalesRepEditComponent } from './WebAPIComponents/SalesRepedit.component';


import { SRCkientiComponent } from './WebAPIComponents/SRCkienti.component';

import { SRCkientiAddComponent } from './WebAPIComponents/SRCkientiadd.component';

import { SRCkientiEditComponent } from './WebAPIComponents/SRCkientiedit.component';


import { TargetSRComponent } from './WebAPIComponents/TargetSR.component';

import { TargetSRAddComponent } from './WebAPIComponents/TargetSRadd.component';

import { TargetSREditComponent } from './WebAPIComponents/TargetSRedit.component';


import { ValueSRComponent } from './WebAPIComponents/ValueSR.component';

import { ValueSRAddComponent } from './WebAPIComponents/ValueSRadd.component';

import { ValueSREditComponent } from './WebAPIComponents/ValueSRedit.component';


import { KPIComponent} from './kpi/kpi.component'

const routes: Routes = [
  { path: 'about', component: AboutComponent },
  { path: 'dashboard', component: DashboardComponent },
  { path: '', redirectTo: '/dashboard', pathMatch: 'full' },


  { path: 'kpi', component:  KPIComponent },

{ path: 'client', component: ClientComponent },

{ path: 'client/add', component: ClientAddComponent },

{ path: 'client/edit/:id', component: ClientEditComponent },


{ path: 'cifreanuale', component: CifreAnualeComponent },

{ path: 'cifreanuale/add', component: CifreAnualeAddComponent },

{ path: 'cifreanuale/edit/:id', component: CifreAnualeEditComponent },

{ path: 'salesrep', component: SalesRepComponent },

{ path: 'salesrep/add', component: SalesRepAddComponent },

{ path: 'salesrep/edit/:id', component: SalesRepEditComponent },


{ path: 'srckienti', component: SRCkientiComponent },

{ path: 'srckienti/add', component: SRCkientiAddComponent },

{ path: 'srckienti/edit/:id', component: SRCkientiEditComponent },

{ path: 'targetsr', component: TargetSRComponent },

{ path: 'targetsr/add', component: TargetSRAddComponent },

{ path: 'targetsr/edit/:id', component: TargetSREditComponent },


{ path: 'valuesr', component: ValueSRComponent },

{ path: 'valuesr/add', component: ValueSRAddComponent },

{ path: 'valuesr/edit/:id', component: ValueSREditComponent },



];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
