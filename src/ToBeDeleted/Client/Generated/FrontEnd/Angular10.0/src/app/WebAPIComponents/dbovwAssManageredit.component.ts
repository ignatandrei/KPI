
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwAssManager } from '../WebAPIClasses/dbovwAssManager';
import { dbovwAssManagerService } from '../services/dbovwAssManager.service';




@Component({
  selector: 'app-dbovwAssManageredit',
  templateUrl: './dbovwAssManageredit.component.html',
  styleUrls: ['./dbovwAssManageredit.component.css']
})
export class dbovwAssManagerEditComponent implements OnInit {

  
  public dataToEdit: dbovwAssManager;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dbovwAssManagerService ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

      ngOnInit(): void {}
      }
      