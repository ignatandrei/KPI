
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwAssClients } from '../WebAPIClasses/dbovwAssClients';
import { dbovwAssClientsService } from '../services/dbovwAssClients.service';




@Component({
  selector: 'app-dbovwAssClientsedit',
  templateUrl: './dbovwAssClientsedit.component.html',
  styleUrls: ['./dbovwAssClientsedit.component.css']
})
export class dbovwAssClientsEditComponent implements OnInit {

  
  public dataToEdit: dbovwAssClients;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dbovwAssClientsService ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

      ngOnInit(): void {}
      }
      