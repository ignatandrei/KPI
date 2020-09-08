
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { SRCkienti } from '../WebAPIClasses/SRCkienti';
import { SRCkientiService } from '../services/SRCkienti.service';
@Component({
  selector: 'app-SRCkientiedit',
  templateUrl: './SRCkientiedit.component.html',
  styleUrls: ['./SRCkientiedit.component.css']
})
export class SRCkientiEditComponent implements OnInit {

  public id: number;
  public dataToEdit: SRCkienti;
  constructor(private route: ActivatedRoute , private router: Router, private mainService: SRCkientiService ) {

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
	const data=new SRCkienti(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/srckienti']);
  }


}
