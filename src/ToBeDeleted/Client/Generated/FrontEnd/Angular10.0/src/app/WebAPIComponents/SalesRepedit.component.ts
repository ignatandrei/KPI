
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { SalesRep } from '../WebAPIClasses/SalesRep';
import { SalesRepService } from '../services/SalesRep.service';
@Component({
  selector: 'app-SalesRepedit',
  templateUrl: './SalesRepedit.component.html',
  styleUrls: ['./SalesRepedit.component.css']
})
export class SalesRepEditComponent implements OnInit {

  public id: number;
  public dataToEdit: SalesRep;
  constructor(private route: ActivatedRoute , private router: Router, private mainService: SalesRepService ) {

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
	const data=new SalesRep(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/salesrep']);
  }


}
