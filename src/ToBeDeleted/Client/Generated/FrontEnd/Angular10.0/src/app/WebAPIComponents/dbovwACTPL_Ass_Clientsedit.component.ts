
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwACTPL_Ass_Clients } from '../WebAPIClasses/dbovwACTPL_Ass_Clients';
import { dbovwACTPL_Ass_ClientsService } from '../services/dbovwACTPL_Ass_Clients.service';




@Component({
  selector: 'app-dbovwACTPL_Ass_Clientsedit',
  templateUrl: './dbovwACTPL_Ass_Clientsedit.component.html',
  styleUrls: ['./dbovwACTPL_Ass_Clientsedit.component.css']
})
export class dbovwACTPL_Ass_ClientsEditComponent implements OnInit {

  
  public dataToEdit: dbovwACTPL_Ass_Clients;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dbovwACTPL_Ass_ClientsService ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

      ngOnInit(): void {}
      }
      