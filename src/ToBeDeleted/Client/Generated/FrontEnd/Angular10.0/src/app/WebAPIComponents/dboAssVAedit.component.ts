
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboAssVA } from '../WebAPIClasses/dboAssVA';
import { dboAssVAService } from '../services/dboAssVA.service';




@Component({
  selector: 'app-dboAssVAedit',
  templateUrl: './dboAssVAedit.component.html',
  styleUrls: ['./dboAssVAedit.component.css']
})
export class dboAssVAEditComponent implements OnInit {


      public id: number;
      
  public dataToEdit: dboAssVA;


      public dboAssVAAll: dboAssVA[] = [];
      
  constructor( private dboAssVASVC:dboAssVAService, private route: ActivatedRoute , private router: Router, private mainService: dboAssVAService ) {

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
        
          }
  public save(): void{
	const data=new dboAssVA(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboassva']);
  }


}
