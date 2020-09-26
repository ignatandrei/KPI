
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboCategory } from '../WebAPIClasses/dboCategory';
import { dboCategoryService } from '../services/dboCategory.service';




@Component({
  selector: 'app-dboCategoryedit',
  templateUrl: './dboCategoryedit.component.html',
  styleUrls: ['./dboCategoryedit.component.css']
})
export class dboCategoryEditComponent implements OnInit {


      public id: number;
      
  public dataToEdit: dboCategory;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dboCategoryService ) {

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
	const data=new dboCategory(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dbocategory']);
  }


}
