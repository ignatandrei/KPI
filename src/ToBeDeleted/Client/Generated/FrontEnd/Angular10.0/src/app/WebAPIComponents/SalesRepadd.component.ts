
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { SalesRep } from '../WebAPIClasses/SalesRep';
import { SalesRepService } from '../services/SalesRep.service';
@Component({
  selector: 'app-SalesRepadd',
  templateUrl: './SalesRepadd.component.html',
  styleUrls: ['./SalesRepadd.component.css']
})
export class SalesRepAddComponent implements OnInit {

  
  public dataToAdd: SalesRep;
  constructor( private router: Router, private mainService: SalesRepService ) {

      this.dataToAdd = new SalesRep();
   }

  ngOnInit(): void {
    
  }
  public add(): void{
	const data=new SalesRep(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/salesrep']);
  }


}
