
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dboKPI11 } from '../WebAPIClasses/dboKPI11';
import { dboKPI11Service } from '../services/dboKPI11.service';




@Component({
  selector: 'app-dboKPI11add',
  templateUrl: './dboKPI11add.component.html',
  styleUrls: ['./dboKPI11add.component.css']
})
export class dboKPI11AddComponent implements OnInit {

  public dataToAdd: dboKPI11;
  constructor( private router: Router, private mainService: dboKPI11Service ) {

      this.dataToAdd = new dboKPI11();
   }

  ngOnInit(): void {
    
  }

    }
    