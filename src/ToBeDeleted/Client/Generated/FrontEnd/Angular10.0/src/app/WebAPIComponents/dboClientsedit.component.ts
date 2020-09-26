
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboClients } from '../WebAPIClasses/dboClients';
import { dboClientsService } from '../services/dboClients.service';




@Component({
  selector: 'app-dboClientsedit',
  templateUrl: './dboClientsedit.component.html',
  styleUrls: ['./dboClientsedit.component.css']
})
export class dboClientsEditComponent implements OnInit {


      public id: number;
      
  public dataToEdit: dboClients;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dboClientsService ) {

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
	const data=new dboClients(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboclients']);
  }


}
