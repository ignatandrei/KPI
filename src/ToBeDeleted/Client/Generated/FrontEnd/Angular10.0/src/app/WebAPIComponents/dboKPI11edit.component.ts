
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboKPI11 } from '../WebAPIClasses/dboKPI11';
import { dboKPI11Service } from '../services/dboKPI11.service';




@Component({
  selector: 'app-dboKPI11edit',
  templateUrl: './dboKPI11edit.component.html',
  styleUrls: ['./dboKPI11edit.component.css']
})
export class dboKPI11EditComponent implements OnInit {

  
  public dataToEdit: dboKPI11;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dboKPI11Service ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

      ngOnInit(): void {}
      }
      