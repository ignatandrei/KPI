
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwClientsBase } from '../WebAPIClasses/dbovwClientsBase';
import { dbovwClientsBaseService } from '../services/dbovwClientsBase.service';




@Component({
  selector: 'app-dbovwClientsBaseedit',
  templateUrl: './dbovwClientsBaseedit.component.html',
  styleUrls: ['./dbovwClientsBaseedit.component.css']
})
export class dbovwClientsBaseEditComponent implements OnInit {

  
  public dataToEdit: dbovwClientsBase;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dbovwClientsBaseService ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

      ngOnInit(): void {}
      }
      