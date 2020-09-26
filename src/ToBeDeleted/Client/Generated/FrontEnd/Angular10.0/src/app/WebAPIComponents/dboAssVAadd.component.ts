
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboAssVA } from '../WebAPIClasses/dboAssVA';
import { dboAssVAService } from '../services/dboAssVA.service';




@Component({
  selector: 'app-dboAssVAadd',
  templateUrl: './dboAssVAadd.component.html',
  styleUrls: ['./dboAssVAadd.component.css']
})
export class dboAssVAAddComponent implements OnInit {


        public dboAssVAAll: dboAssVA[] = [];
          public dataToAdd: dboAssVA;
  constructor( private dboAssVASVC:dboAssVAService, private router: Router, private mainService: dboAssVAService ) {

      this.dataToAdd = new dboAssVA();
   }

  ngOnInit(): void {
    

      this.dboAssVASVC.GetAll().subscribe(it => this. dboAssVAAll = it );
      
        }

  public add(): void{
	const data=new dboAssVA(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboassva']);
  }


}
