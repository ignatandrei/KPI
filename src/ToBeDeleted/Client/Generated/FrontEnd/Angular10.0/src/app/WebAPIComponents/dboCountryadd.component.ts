
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboCountry } from '../WebAPIClasses/dboCountry';
import { dboCountryService } from '../services/dboCountry.service';




@Component({
  selector: 'app-dboCountryadd',
  templateUrl: './dboCountryadd.component.html',
  styleUrls: ['./dboCountryadd.component.css']
})
export class dboCountryAddComponent implements OnInit {

  public dataToAdd: dboCountry;
  constructor( private router: Router, private mainService: dboCountryService ) {

      this.dataToAdd = new dboCountry();
   }

  ngOnInit(): void {
    
  }

  public add(): void{
	const data=new dboCountry(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dbocountry']);
  }


}
