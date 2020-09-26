
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboACTPL } from '../WebAPIClasses/dboACTPL';
import { dboACTPLService } from '../services/dboACTPL.service';



    import { dboAssVAClientsCountiesService } from '../services/dboAssVAClientsCounties.service';
    import{ dboAssVAClientsCounties } from '../WebAPIClasses/dboAssVAClientsCounties';
    

@Component({
  selector: 'app-dboACTPLedit',
  templateUrl: './dboACTPLedit.component.html',
  styleUrls: ['./dboACTPLedit.component.css']
})
export class dboACTPLEditComponent implements OnInit {


      public id: number;
      
  public dataToEdit: dboACTPL;


      public dboAssVAClientsCountiesAll: dboAssVAClientsCounties[] = [];
      
  constructor( private dboAssVAClientsCountiesSVC:dboAssVAClientsCountiesService, private route: ActivatedRoute , private router: Router, private mainService: dboACTPLService ) {

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


        this.dboAssVAClientsCountiesSVC.GetAll().subscribe(it => this. dboAssVAClientsCountiesAll = it );
        
          }
  public save(): void{
	const data=new dboACTPL(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboactpl']);
  }


}
