

import { BrowserModule } from '@angular/platform-browser';
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
import { KPIComponent } from './kpi/kpi.component';

import { NgxChartsModule } from '@swimlane/ngx-charts';
import { NNDvsUnivComponent } from './WebAPIComponents/NNDvsUniv.component';
import {NNDvsUnivAddComponent} from './WebAPIComponents/NNDvsUnivadd.component';
import {NNDvsUnivEditComponent} from'./WebAPIComponents/NNDvsUnivedit.component';





@NgModule({
  declarations: [

    KPIComponent,

    
    ClientComponent,
    ClientAddComponent,
		ClientEditComponent,
    NNDvsUnivComponent,
    NNDvsUnivAddComponent,
    NNDvsUnivEditComponent,
    CifreAnualeComponent,
    CifreAnualeAddComponent,
    CifreAnualeEditComponent,
    
    SalesRepComponent,
    SalesRepAddComponent,
		SalesRepEditComponent,
		
    SRCkientiComponent,
    SRCkientiAddComponent,
    SRCkientiEditComponent,
    
    TargetSRComponent,
    TargetSRAddComponent,
		TargetSREditComponent,
		
    ValueSRComponent,
    ValueSRAddComponent,
		ValueSREditComponent,
    
		    AppComponent,
    NavbarComponent,
    AboutComponent,
    DashboardComponent,
    KPIComponent 
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
  ...httpInterceptorProviders
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
