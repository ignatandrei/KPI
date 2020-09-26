
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwClientsCountryCategory } from '../WebAPIClasses/dbovwClientsCountryCategory';
import { dbovwClientsCountryCategoryService } from '../services/dbovwClientsCountryCategory.service';




@Component({
  selector: 'app-dbovwClientsCountryCategoryedit',
  templateUrl: './dbovwClientsCountryCategoryedit.component.html',
  styleUrls: ['./dbovwClientsCountryCategoryedit.component.css']
})
export class dbovwClientsCountryCategoryEditComponent implements OnInit {

  
  public dataToEdit: dbovwClientsCountryCategory;


  constructor( private route: ActivatedRoute , private router: Router, private mainService: dbovwClientsCountryCategoryService ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

      ngOnInit(): void {}
      }
      