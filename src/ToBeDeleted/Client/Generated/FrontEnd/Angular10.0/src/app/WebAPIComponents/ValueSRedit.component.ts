
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { ValueSR } from '../WebAPIClasses/ValueSR';
import { ValueSRService } from '../services/ValueSR.service';
@Component({
  selector: 'app-ValueSRedit',
  templateUrl: './ValueSRedit.component.html',
  styleUrls: ['./ValueSRedit.component.css']
})
export class ValueSREditComponent implements OnInit {

  public id: number;
  public dataToEdit: ValueSR;
  constructor(private route: ActivatedRoute , private router: Router, private mainService: ValueSRService ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

  ngOnInit(): void {
    this.route.paramMap.pipe(
      tap(params => this.id = +params.get('id') ),
      switchMap(it => this.mainService.Get(this.id) ),
      delay(1000),
      tap(it => this.dataToEdit = it)
      )
  .subscribe();

  }
  public save(): void{
	const data=new ValueSR(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/valuesr']);
  }


}
