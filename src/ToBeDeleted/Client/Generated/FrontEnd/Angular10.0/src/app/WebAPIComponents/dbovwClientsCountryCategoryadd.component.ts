
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { dbovwClientsCountryCategory } from '../WebAPIClasses/dbovwClientsCountryCategory';
import { dbovwClientsCountryCategoryService } from '../services/dbovwClientsCountryCategory.service';




@Component({
  selector: 'app-dbovwClientsCountryCategoryadd',
  templateUrl: './dbovwClientsCountryCategoryadd.component.html',
  styleUrls: ['./dbovwClientsCountryCategoryadd.component.css']
})
export class dbovwClientsCountryCategoryAddComponent implements OnInit {

  public dataToAdd: dbovwClientsCountryCategory;
  constructor( private router: Router, private mainService: dbovwClientsCountryCategoryService ) {

      this.dataToAdd = new dbovwClientsCountryCategory();
   }

  ngOnInit(): void {
    
  }

    }
    