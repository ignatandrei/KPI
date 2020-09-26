
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboClientsCategory } from '../WebAPIClasses/dboClientsCategory';
import { dboClientsCategoryService } from '../services/dboClientsCategory.service';



    import { dboCategoryService } from '../services/dboCategory.service';
    import{ dboCategory } from '../WebAPIClasses/dboCategory';
    
    import { dboClientsService } from '../services/dboClients.service';
    import{ dboClients } from '../WebAPIClasses/dboClients';
    

@Component({
  selector: 'app-dboClientsCategoryadd',
  templateUrl: './dboClientsCategoryadd.component.html',
  styleUrls: ['./dboClientsCategoryadd.component.css']
})
export class dboClientsCategoryAddComponent implements OnInit {


        public dboCategoryAll: dboCategory[] = [];
        
        public dboClientsAll: dboClients[] = [];
          public dataToAdd: dboClientsCategory;
  constructor( private dboCategorySVC:dboCategoryService, private dboClientsSVC:dboClientsService, private router: Router, private mainService: dboClientsCategoryService ) {

      this.dataToAdd = new dboClientsCategory();
   }

  ngOnInit(): void {
    

      this.dboCategorySVC.GetAll().subscribe(it => this. dboCategoryAll = it );
      
      
      this.dboClientsSVC.GetAll().subscribe(it => this. dboClientsAll = it );
      
        }

  public add(): void{
	const data=new dboClientsCategory(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboclientscategory']);
  }


}
