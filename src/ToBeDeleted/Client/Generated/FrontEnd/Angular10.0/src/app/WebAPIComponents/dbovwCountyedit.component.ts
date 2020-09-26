
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwCounty } from '../WebAPIClasses/dbovwCounty';
import { dbovwCountyService } from '../services/dbovwCounty.service';




@Component({
  selector: 'app-dbovwCountyedit',
  templateUrl: './dbovwCountyedit.component.html',
  styleUrls: ['./dbovwCountyedit.component.css']
})
export class dbovwCountyEditComponent implements OnInit {

  
  public dataToEdit: dbovwCounty;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dbovwCountyService ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

      ngOnInit(): void {}
      }
      