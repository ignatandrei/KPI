
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwCounty } from '../WebAPIClasses/dbovwCounty';
import { dbovwCountyService } from '../services/dbovwCounty.service';




@Component({
  selector: 'app-dbovwCountyadd',
  templateUrl: './dbovwCountyadd.component.html',
  styleUrls: ['./dbovwCountyadd.component.css']
})
export class dbovwCountyAddComponent implements OnInit {

  public dataToAdd: dbovwCounty;
  constructor( private router: Router, private mainService: dbovwCountyService ) {

      this.dataToAdd = new dbovwCounty();
   }

  ngOnInit(): void {
    
  }

    }
    