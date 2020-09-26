
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwACTPL_Ass_Clients } from '../WebAPIClasses/dbovwACTPL_Ass_Clients';
import { dbovwACTPL_Ass_ClientsService } from '../services/dbovwACTPL_Ass_Clients.service';




@Component({
  selector: 'app-dbovwACTPL_Ass_Clientsadd',
  templateUrl: './dbovwACTPL_Ass_Clientsadd.component.html',
  styleUrls: ['./dbovwACTPL_Ass_Clientsadd.component.css']
})
export class dbovwACTPL_Ass_ClientsAddComponent implements OnInit {

  public dataToAdd: dbovwACTPL_Ass_Clients;
  constructor( private router: Router, private mainService: dbovwACTPL_Ass_ClientsService ) {

      this.dataToAdd = new dbovwACTPL_Ass_Clients();
   }

  ngOnInit(): void {
    
  }

    }
    