
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboAssVAClientsCounties } from '../WebAPIClasses/dboAssVAClientsCounties';
import { dboAssVAClientsCountiesService } from '../services/dboAssVAClientsCounties.service';



    import { dboAssVAService } from '../services/dboAssVA.service';
    import{ dboAssVA } from '../WebAPIClasses/dboAssVA';
    
    import { dboClientsCountiesService } from '../services/dboClientsCounties.service';
    import{ dboClientsCounties } from '../WebAPIClasses/dboClientsCounties';
    

@Component({
  selector: 'app-dboAssVAClientsCountiesedit',
  templateUrl: './dboAssVAClientsCountiesedit.component.html',
  styleUrls: ['./dboAssVAClientsCountiesedit.component.css']
})
export class dboAssVAClientsCountiesEditComponent implements OnInit {


      public id: number;
      
  public dataToEdit: dboAssVAClientsCounties;


      public dboAssVAAll: dboAssVA[] = [];
      
      public dboClientsCountiesAll: dboClientsCounties[] = [];
      
  constructor( private dboAssVASVC:dboAssVAService, private dboClientsCountiesSVC:dboClientsCountiesService, private route: ActivatedRoute , private router: Router, private mainService: dboAssVAClientsCountiesService ) {

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


        this.dboAssVASVC.GetAll().subscribe(it => this. dboAssVAAll = it );
        
        
        this.dboClientsCountiesSVC.GetAll().subscribe(it => this. dboClientsCountiesAll = it );
        
          }
  public save(): void{
	const data=new dboAssVAClientsCounties(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboassvaclientscounties']);
  }


}
