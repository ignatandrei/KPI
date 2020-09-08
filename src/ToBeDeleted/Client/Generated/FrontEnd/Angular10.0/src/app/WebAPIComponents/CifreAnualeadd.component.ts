
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { CifreAnuale } from '../WebAPIClasses/CifreAnuale';
import { CifreAnualeService } from '../services/CifreAnuale.service';
@Component({
  selector: 'app-CifreAnualeadd',
  templateUrl: './CifreAnualeadd.component.html',
  styleUrls: ['./CifreAnualeadd.component.css']
})
export class CifreAnualeAddComponent implements OnInit {

  
  public dataToAdd: CifreAnuale;
  constructor( private router: Router, private mainService: CifreAnualeService ) {

      this.dataToAdd = new CifreAnuale();
   }

  ngOnInit(): void {
    
  }
  public add(): void{
	const data=new CifreAnuale(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/cifreanuale']);
  }


}
