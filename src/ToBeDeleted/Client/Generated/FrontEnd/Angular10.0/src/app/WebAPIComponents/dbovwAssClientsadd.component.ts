
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwAssClients } from '../WebAPIClasses/dbovwAssClients';
import { dbovwAssClientsService } from '../services/dbovwAssClients.service';




@Component({
  selector: 'app-dbovwAssClientsadd',
  templateUrl: './dbovwAssClientsadd.component.html',
  styleUrls: ['./dbovwAssClientsadd.component.css']
})
export class dbovwAssClientsAddComponent implements OnInit {

  public dataToAdd: dbovwAssClients;
  constructor( private router: Router, private mainService: dbovwAssClientsService ) {

      this.dataToAdd = new dbovwAssClients();
   }

  ngOnInit(): void {
    
  }

    }
    