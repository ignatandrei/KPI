
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { SRCkienti } from '../WebAPIClasses/SRCkienti';
import { SRCkientiService } from '../services/SRCkienti.service';
@Component({
  selector: 'app-SRCkientiadd',
  templateUrl: './SRCkientiadd.component.html',
  styleUrls: ['./SRCkientiadd.component.css']
})
export class SRCkientiAddComponent implements OnInit {

  
  public dataToAdd: SRCkienti;
  constructor( private router: Router, private mainService: SRCkientiService ) {

      this.dataToAdd = new SRCkienti();
   }

  ngOnInit(): void {
    
  }
  public add(): void{
	const data=new SRCkienti(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/srckienti']);
  }


}
