
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { TargetSR } from '../WebAPIClasses/TargetSR';
import { TargetSRService } from '../services/TargetSR.service';
@Component({
  selector: 'app-TargetSRadd',
  templateUrl: './TargetSRadd.component.html',
  styleUrls: ['./TargetSRadd.component.css']
})
export class TargetSRAddComponent implements OnInit {

  
  public dataToAdd: TargetSR;
  constructor( private router: Router, private mainService: TargetSRService ) {

      this.dataToAdd = new TargetSR();
   }

  ngOnInit(): void {
    
  }
  public add(): void{
	const data=new TargetSR(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/targetsr']);
  }


}
