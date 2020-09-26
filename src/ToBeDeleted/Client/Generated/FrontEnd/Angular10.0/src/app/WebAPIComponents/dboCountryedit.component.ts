
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboCountry } from '../WebAPIClasses/dboCountry';
import { dboCountryService } from '../services/dboCountry.service';




@Component({
  selector: 'app-dboCountryedit',
  templateUrl: './dboCountryedit.component.html',
  styleUrls: ['./dboCountryedit.component.css']
})
export class dboCountryEditComponent implements OnInit {


      public id: number;
      
  public dataToEdit: dboCountry;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dboCountryService ) {

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

  }
  public save(): void{
	const data=new dboCountry(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dbocountry']);
  }


}
