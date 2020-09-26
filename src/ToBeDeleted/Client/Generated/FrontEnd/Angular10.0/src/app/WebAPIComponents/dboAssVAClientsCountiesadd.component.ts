
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboAssVAClientsCounties } from '../WebAPIClasses/dboAssVAClientsCounties';
import { dboAssVAClientsCountiesService } from '../services/dboAssVAClientsCounties.service';



    import { dboAssVAService } from '../services/dboAssVA.service';
    import{ dboAssVA } from '../WebAPIClasses/dboAssVA';
    
    import { dboClientsCountiesService } from '../services/dboClientsCounties.service';
    import{ dboClientsCounties } from '../WebAPIClasses/dboClientsCounties';
    

@Component({
  selector: 'app-dboAssVAClientsCountiesadd',
  templateUrl: './dboAssVAClientsCountiesadd.component.html',
  styleUrls: ['./dboAssVAClientsCountiesadd.component.css']
})
export class dboAssVAClientsCountiesAddComponent implements OnInit {


        public dboAssVAAll: dboAssVA[] = [];
        
        public dboClientsCountiesAll: dboClientsCounties[] = [];
          public dataToAdd: dboAssVAClientsCounties;
  constructor( private dboAssVASVC:dboAssVAService, private dboClientsCountiesSVC:dboClientsCountiesService, private router: Router, private mainService: dboAssVAClientsCountiesService ) {

      this.dataToAdd = new dboAssVAClientsCounties();
   }

  ngOnInit(): void {
    

      this.dboAssVASVC.GetAll().subscribe(it => this. dboAssVAAll = it );
      
      
      this.dboClientsCountiesSVC.GetAll().subscribe(it => this. dboClientsCountiesAll = it );
      
        }

  public add(): void{
	const data=new dboAssVAClientsCounties(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboassvaclientscounties']);
  }


}
