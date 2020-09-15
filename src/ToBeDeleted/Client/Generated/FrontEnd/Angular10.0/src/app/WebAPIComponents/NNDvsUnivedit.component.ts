
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { NNDvsUniv } from '../WebAPIClasses/NNDvsUniv';
import { NNDvsUnivService } from '../services/NNDvsUniv.service';
@Component({
  selector: 'app-NNDvsUnivedit',
  templateUrl: './NNDvsUnivedit.component.html',
  styleUrls: ['./NNDvsUnivedit.component.css']
})
export class NNDvsUnivEditComponent implements OnInit {

  public id: number;
  public dataToEdit: NNDvsUniv;
  constructor(private route: ActivatedRoute , private router: Router, private mainService: NNDvsUnivService ) {

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
	const data=new NNDvsUniv(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/nndvsuniv']);
  }


}
