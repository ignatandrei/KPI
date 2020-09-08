
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { TargetSR } from '../WebAPIClasses/TargetSR';
import { TargetSRService } from '../services/TargetSR.service';
@Component({
  selector: 'app-TargetSRedit',
  templateUrl: './TargetSRedit.component.html',
  styleUrls: ['./TargetSRedit.component.css']
})
export class TargetSREditComponent implements OnInit {

  public id: number;
  public dataToEdit: TargetSR;
  constructor(private route: ActivatedRoute , private router: Router, private mainService: TargetSRService ) {

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
	const data=new TargetSR(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/targetsr']);
  }


}