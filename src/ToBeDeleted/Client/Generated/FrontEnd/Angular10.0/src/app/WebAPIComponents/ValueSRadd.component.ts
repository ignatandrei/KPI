
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { ValueSR } from '../WebAPIClasses/ValueSR';
import { ValueSRService } from '../services/ValueSR.service';
@Component({
  selector: 'app-ValueSRadd',
  templateUrl: './ValueSRadd.component.html',
  styleUrls: ['./ValueSRadd.component.css']
})
export class ValueSRAddComponent implements OnInit {

  
  public dataToAdd: ValueSR;
  constructor( private router: Router, private mainService: ValueSRService ) {

      this.dataToAdd = new ValueSR();
   }

  ngOnInit(): void {
    
  }
  public add(): void{
	const data=new ValueSR(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/valuesr']);
  }


}
