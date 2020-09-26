
import { UrlSerializer } from '@angular/router';

import { BrowserModule, Title } from '@angular/platform-browser';
import {NgModule} from '@angular/core';
import {A11yModule} from '@angular/cdk/a11y';
import {ClipboardModule} from '@angular/cdk/clipboard';
import {DragDropModule} from '@angular/cdk/drag-drop';
import {PortalModule} from '@angular/cdk/portal';
import {ScrollingModule} from '@angular/cdk/scrolling';
import {CdkStepperModule} from '@angular/cdk/stepper';
import {CdkTableModule} from '@angular/cdk/table';
import {CdkTreeModule} from '@angular/cdk/tree';
import {MatAutocompleteModule} from '@angular/material/autocomplete';
import {MatBadgeModule} from '@angular/material/badge';
import {MatBottomSheetModule} from '@angular/material/bottom-sheet';
import {MatButtonModule} from '@angular/material/button';
import {MatButtonToggleModule} from '@angular/material/button-toggle';
import {MatCardModule} from '@angular/material/card';
import {MatCheckboxModule} from '@angular/material/checkbox';
import {MatChipsModule} from '@angular/material/chips';
import {MatStepperModule} from '@angular/material/stepper';
import {MatDatepickerModule} from '@angular/material/datepicker';
import {MatDialogModule} from '@angular/material/dialog';
import {MatDividerModule} from '@angular/material/divider';
import {MatExpansionModule} from '@angular/material/expansion';
import {MatGridListModule} from '@angular/material/grid-list';
import {MatIconModule} from '@angular/material/icon';
import {MatInputModule} from '@angular/material/input';
import {MatListModule} from '@angular/material/list';
import {MatMenuModule} from '@angular/material/menu';
import {MatNativeDateModule, MatRippleModule} from '@angular/material/core';
import {MatPaginatorModule} from '@angular/material/paginator';
import {MatProgressBarModule} from '@angular/material/progress-bar';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';
import {MatRadioModule} from '@angular/material/radio';
import {MatSelectModule} from '@angular/material/select';
import {MatSidenavModule} from '@angular/material/sidenav';
import {MatSliderModule} from '@angular/material/slider';
import {MatSlideToggleModule} from '@angular/material/slide-toggle';
import {MatSnackBarModule} from '@angular/material/snack-bar';
import {MatSortModule} from '@angular/material/sort';
import {MatTableModule} from '@angular/material/table';
import {MatTabsModule} from '@angular/material/tabs';
import {MatToolbarModule} from '@angular/material/toolbar';
import {MatTooltipModule} from '@angular/material/tooltip';
import {MatTreeModule} from '@angular/material/tree';
import {OverlayModule} from '@angular/cdk/overlay';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NavbarComponent } from './navbar/navbar.component';
import { AboutComponent } from './about/about.component';
import { LayoutModule } from '@angular/cdk/layout';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { APP_BASE_HREF, PlatformLocation } from '@angular/common';
import { DashboardComponent } from './dashboard/dashboard.component';
import { FormsModule } from '@angular/forms';
import { httpInterceptorProviders } from './interceptors/barrelInterceptors';
import { LowerCaseUrlSerializer } from './routeHelper/lowercase';
import { NgxChartsModule } from '@swimlane/ngx-charts';


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



@NgModule({
  declarations: [

    dboACTPLComponent,
    dboACTPLAddComponent,
		dboACTPLEditComponent,
		
    dboAssVAComponent,
    dboAssVAAddComponent,
		dboAssVAEditComponent,
		
    dboAssVAClientsCountiesComponent,
    dboAssVAClientsCountiesAddComponent,
		dboAssVAClientsCountiesEditComponent,
		
    dboCategoryComponent,
    dboCategoryAddComponent,
		dboCategoryEditComponent,
		
    dboClientsComponent,
    dboClientsAddComponent,
		dboClientsEditComponent,
		
    dboClientsCategoryComponent,
    dboClientsCategoryAddComponent,
		dboClientsCategoryEditComponent,
		
    dboClientsCountiesComponent,
    dboClientsCountiesAddComponent,
		dboClientsCountiesEditComponent,
		
    dboCountryComponent,
    dboCountryAddComponent,
		dboCountryEditComponent,
		
    dboCountyComponent,
    dboCountyAddComponent,
		dboCountyEditComponent,
		
    dboKPI11Component,
    dboKPI11AddComponent,
		dboKPI11EditComponent,
		
    dbovwACTPL_Ass_ClientsComponent,
    dbovwACTPL_Ass_ClientsAddComponent,
		dbovwACTPL_Ass_ClientsEditComponent,
		
    dbovwAssClientsComponent,
    dbovwAssClientsAddComponent,
		dbovwAssClientsEditComponent,
		
    dbovwAssManagerComponent,
    dbovwAssManagerAddComponent,
		dbovwAssManagerEditComponent,
		
    dbovwClientsBaseComponent,
    dbovwClientsBaseAddComponent,
		dbovwClientsBaseEditComponent,
		
    dbovwClientsCountryCategoryComponent,
    dbovwClientsCountryCategoryAddComponent,
		dbovwClientsCountryCategoryEditComponent,
		
    dbovwCountyComponent,
    dbovwCountyAddComponent,
		dbovwCountyEditComponent,
		    AppComponent,
    NavbarComponent,
    AboutComponent,
    DashboardComponent 
  ],
  imports: [
    NgxChartsModule,
    FormsModule,
    HttpClientModule,
    BrowserModule,
    BrowserAnimationsModule,
    AppRoutingModule,
    LayoutModule,
    A11yModule,
    ClipboardModule,
    CdkStepperModule,
    CdkTableModule,
    CdkTreeModule,
    DragDropModule,
    MatAutocompleteModule,
    MatBadgeModule,
    MatBottomSheetModule,
    MatButtonModule,
    MatButtonToggleModule,
    MatCardModule,
    MatCheckboxModule,
    MatChipsModule,
    MatStepperModule,
    MatDatepickerModule,
    MatDialogModule,
    MatDividerModule,
    MatExpansionModule,
    MatGridListModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatMenuModule,
    MatNativeDateModule,
    MatPaginatorModule,
    MatProgressBarModule,
    MatProgressSpinnerModule,
    MatRadioModule,
    MatRippleModule,
    MatSelectModule,
    MatSidenavModule,
    MatSliderModule,
    MatSlideToggleModule,
    MatSnackBarModule,
    MatSortModule,
    MatTableModule,
    MatTabsModule,
    MatToolbarModule,
    MatTooltipModule,
    MatTreeModule,
    OverlayModule,
    PortalModule,
    ScrollingModule,
  ],
  providers: [{
    provide: APP_BASE_HREF,
    useFactory: (s: PlatformLocation) => s.getBaseHrefFromDOM(),
    deps: [PlatformLocation]
  },
  ...httpInterceptorProviders,
  {
    provide: UrlSerializer,
    useClass: LowerCaseUrlSerializer
  } ,
  Title,
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
