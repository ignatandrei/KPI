
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboCounty } from '../WebAPIClasses/dboCounty';
import { dboCountyService } from '../services/dboCounty.service';



    import { dboCountryService } from '../services/dboCountry.service';
    import{ dboCountry } from '../WebAPIClasses/dboCountry';
    

@Component({
  selector: 'app-dboCountyedit',
  templateUrl: './dboCountyedit.component.html',
  styleUrls: ['./dboCountyedit.component.css']
})
export class dboCountyEditComponent implements OnInit {


      public id: number;
      
  public dataToEdit: dboCounty;


      public dboCountryAll: dboCountry[] = [];
      
  constructor( private dboCountrySVC:dboCountryService, private route: ActivatedRoute , private router: Router, private mainService: dboCountyService ) {

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


        this.dboCountrySVC.GetAll().subscribe(it => this. dboCountryAll = it );
        
          }
  public save(): void{
	const data=new dboCounty(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dbocounty']);
  }


}
