
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwClientsBase } from '../WebAPIClasses/dbovwClientsBase';
import { dbovwClientsBaseService } from '../services/dbovwClientsBase.service';




@Component({
  selector: 'app-dbovwClientsBaseadd',
  templateUrl: './dbovwClientsBaseadd.component.html',
  styleUrls: ['./dbovwClientsBaseadd.component.css']
})
export class dbovwClientsBaseAddComponent implements OnInit {

  public dataToAdd: dbovwClientsBase;
  constructor( private router: Router, private mainService: dbovwClientsBaseService ) {

      this.dataToAdd = new dbovwClientsBase();
   }

  ngOnInit(): void {
    
  }

    }
    