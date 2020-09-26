
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwAssManager } from '../WebAPIClasses/dbovwAssManager';
import { dbovwAssManagerService } from '../services/dbovwAssManager.service';




@Component({
  selector: 'app-dbovwAssManageradd',
  templateUrl: './dbovwAssManageradd.component.html',
  styleUrls: ['./dbovwAssManageradd.component.css']
})
export class dbovwAssManagerAddComponent implements OnInit {

  public dataToAdd: dbovwAssManager;
  constructor( private router: Router, private mainService: dbovwAssManagerService ) {

      this.dataToAdd = new dbovwAssManager();
   }

  ngOnInit(): void {
    
  }

    }
    