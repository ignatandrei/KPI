
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboACTPL } from '../WebAPIClasses/dboACTPL';
import { dboACTPLService } from '../services/dboACTPL.service';



    import { dboAssVAClientsCountiesService } from '../services/dboAssVAClientsCounties.service';
    import{ dboAssVAClientsCounties } from '../WebAPIClasses/dboAssVAClientsCounties';
    

@Component({
  selector: 'app-dboACTPLadd',
  templateUrl: './dboACTPLadd.component.html',
  styleUrls: ['./dboACTPLadd.component.css']
})
export class dboACTPLAddComponent implements OnInit {


        public dboAssVAClientsCountiesAll: dboAssVAClientsCounties[] = [];
          public dataToAdd: dboACTPL;
  constructor( private dboAssVAClientsCountiesSVC:dboAssVAClientsCountiesService, private router: Router, private mainService: dboACTPLService ) {

      this.dataToAdd = new dboACTPL();
   }

  ngOnInit(): void {
    

      this.dboAssVAClientsCountiesSVC.GetAll().subscribe(it => this. dboAssVAClientsCountiesAll = it );
      
        }

  public add(): void{
	const data=new dboACTPL(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboactpl']);
  }


}
