
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboClientsCounties } from '../WebAPIClasses/dboClientsCounties';
import { dboClientsCountiesService } from '../services/dboClientsCounties.service';



    import { dboClientsService } from '../services/dboClients.service';
    import{ dboClients } from '../WebAPIClasses/dboClients';
    
    import { dboCountyService } from '../services/dboCounty.service';
    import{ dboCounty } from '../WebAPIClasses/dboCounty';
    

@Component({
  selector: 'app-dboClientsCountiesadd',
  templateUrl: './dboClientsCountiesadd.component.html',
  styleUrls: ['./dboClientsCountiesadd.component.css']
})
export class dboClientsCountiesAddComponent implements OnInit {


        public dboClientsAll: dboClients[] = [];
        
        public dboCountyAll: dboCounty[] = [];
          public dataToAdd: dboClientsCounties;
  constructor( private dboClientsSVC:dboClientsService, private dboCountySVC:dboCountyService, private router: Router, private mainService: dboClientsCountiesService ) {

      this.dataToAdd = new dboClientsCounties();
   }

  ngOnInit(): void {
    

      this.dboClientsSVC.GetAll().subscribe(it => this. dboClientsAll = it );
      
      
      this.dboCountySVC.GetAll().subscribe(it => this. dboCountyAll = it );
      
        }

  public add(): void{
	const data=new dboClientsCounties(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dboclientscounties']);
  }


}
