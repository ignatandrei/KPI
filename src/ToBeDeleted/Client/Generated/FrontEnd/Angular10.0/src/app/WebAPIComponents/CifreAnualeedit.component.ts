
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { CifreAnuale } from '../WebAPIClasses/CifreAnuale';
import { CifreAnualeService } from '../services/CifreAnuale.service';
@Component({
  selector: 'app-CifreAnualeedit',
  templateUrl: './CifreAnualeedit.component.html',
  styleUrls: ['./CifreAnualeedit.component.css']
})
export class CifreAnualeEditComponent implements OnInit {

  public id: number;
  public dataToEdit: CifreAnuale;
  constructor(private route: ActivatedRoute , private router: Router, private mainService: CifreAnualeService ) {

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
	const data=new CifreAnuale(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/cifreanuale']);
  }


}
