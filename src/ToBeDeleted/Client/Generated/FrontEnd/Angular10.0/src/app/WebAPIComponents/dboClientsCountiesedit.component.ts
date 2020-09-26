
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboClientsCounties } from '../WebAPIClasses/dboClientsCounties';
import { dboClientsCountiesService } from '../services/dboClientsCounties.service';



    import { dboClientsService } from '../services/dboClients.service';
    import{ dboClients } from '../WebAPIClasses/dboClients';
    
    import { dboCountyService } from '../services/dboCounty.service';
    import{ dboCounty } from '../WebAPIClasses/dboCounty';
    

@Component({
  selector: 'app-dboClientsCountiesedit',
  templateUrl: './dboClientsCountiesedit.component.html',
  styleUrls: ['./dboClientsCountiesedit.component.css']
})
export class dboClientsCountiesEditComponent implements OnInit {


      public id: number;
      
  public dataToEdit: dboClientsCounties;


      public dboClientsAll: dboClients[] = [];
      
      public dboCountyAll: dboCounty[] = [];
      
  constructor( private dboClientsSVC:dboClientsService, private dboCountySVC:dboCountyService, private route: ActivatedRoute , private router: Router, private mainService: dboClientsCountiesService ) {

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


        this.dboClientsSVC.GetAll().subscribe(it => this. dboClientsAll = it );
        
        
        this.dboCountySVC.GetAll().subscribe(it => this. dboCountyAll = it );
        
          }
  public save(): void{
	const data=new dboClientsCounties(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboclientscounties']);
  }


}
