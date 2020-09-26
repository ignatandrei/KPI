
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboClients } from '../WebAPIClasses/dboClients';
import { dboClientsService } from '../services/dboClients.service';




@Component({
  selector: 'app-dboClientsadd',
  templateUrl: './dboClientsadd.component.html',
  styleUrls: ['./dboClientsadd.component.css']
})
export class dboClientsAddComponent implements OnInit {

  public dataToAdd: dboClients;
  constructor( private router: Router, private mainService: dboClientsService ) {

      this.dataToAdd = new dboClients();
   }

  ngOnInit(): void {
    
  }

  public add(): void{
	const data=new dboClients(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboclients']);
  }


}
