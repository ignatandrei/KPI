
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
  selector: 'app-dboClientsCategoryedit',
  templateUrl: './dboClientsCategoryedit.component.html',
  styleUrls: ['./dboClientsCategoryedit.component.css']
})
export class dboClientsCategoryEditComponent implements OnInit {


      public id: number;
      
  public dataToEdit: dboClientsCategory;


      public dboCategoryAll: dboCategory[] = [];
      
      public dboClientsAll: dboClients[] = [];
      
  constructor( private dboCategorySVC:dboCategoryService, private dboClientsSVC:dboClientsService, private route: ActivatedRoute , private router: Router, private mainService: dboClientsCategoryService ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

  ngOnInit(): void {
    this.route.paramMap.pipe(
      tap(params => this.id = +params.get('id') ),
      switchMap(it => this.mainService.Get(this.id) ),
      delay(1000),
      tap(it => this.dataToEdit = it)
      )
  .subscribe();


        this.dboCategorySVC.GetAll().subscribe(it => this. dboCategoryAll = it );
        
        
        this.dboClientsSVC.GetAll().subscribe(it => this. dboClientsAll = it );
        
          }
  public save(): void{
	const data=new dboClientsCategory(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboclientscategory']);
  }


}
