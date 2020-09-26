
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboCategory } from '../WebAPIClasses/dboCategory';
import { dboCategoryService } from '../services/dboCategory.service';




@Component({
  selector: 'app-dboCategoryadd',
  templateUrl: './dboCategoryadd.component.html',
  styleUrls: ['./dboCategoryadd.component.css']
})
export class dboCategoryAddComponent implements OnInit {

  public dataToAdd: dboCategory;
  constructor( private router: Router, private mainService: dboCategoryService ) {

      this.dataToAdd = new dboCategory();
   }

  ngOnInit(): void {
    
  }

  public add(): void{
	const data=new dboCategory(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/dbocategory']);
  }


}
