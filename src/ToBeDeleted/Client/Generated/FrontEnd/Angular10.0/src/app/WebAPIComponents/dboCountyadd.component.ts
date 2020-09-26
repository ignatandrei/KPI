
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboCounty } from '../WebAPIClasses/dboCounty';
import { dboCountyService } from '../services/dboCounty.service';



    import { dboCountryService } from '../services/dboCountry.service';
    import{ dboCountry } from '../WebAPIClasses/dboCountry';
    

@Component({
  selector: 'app-dboCountyadd',
  templateUrl: './dboCountyadd.component.html',
  styleUrls: ['./dboCountyadd.component.css']
})
export class dboCountyAddComponent implements OnInit {


        public dboCountryAll: dboCountry[] = [];
          public dataToAdd: dboCounty;
  constructor( private dboCountrySVC:dboCountryService, private router: Router, private mainService: dboCountyService ) {

      this.dataToAdd = new dboCounty();
   }

  ngOnInit(): void {
    

      this.dboCountrySVC.GetAll().subscribe(it => this. dboCountryAll = it );
      
        }

  public add(): void{
	const data=new dboCounty(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dbocounty']);
  }


}
