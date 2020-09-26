import {Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';

import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Title, Meta } from '@angular/platform-browser';

import{ dbovwClientsCountryCategory } from './../WebAPIClasses/dbovwClientsCountryCategory';
import {dbovwClientsCountryCategoryService} from './../services/dbovwClientsCountryCategory.service';

@Component({
  selector: 'app-dbovwClientsCountryCategory-component',
  templateUrl: './dbovwClientsCountryCategory.component.html',
  styleUrls: ['./dbovwClientsCountryCategory.component.css']
})
export class dbovwClientsCountryCategoryComponent implements OnInit {

  displayedColumns: string[] = [ 'rowIndex' ,'idclient','namecategory','nameclient','namecountry','namecounty','shortnamecategory','shortnameclient','shortnamecountry','shortnamecounty'    ];
  dataSource: MatTableDataSource<dbovwClientsCountryCategory>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  

  public rows:dbovwClientsCountryCategory[]=[];
  constructor(private mainService: dbovwClientsCountryCategoryService, private router: Router,private titleService: Title,  private metaService: Meta  ) {
      this.titleService.setTitle('List of dbo.vwClientsCountryCategory');
      this.metaService.addTags([
        {name: 'keywords', content: 'dbo.vwClientsCountryCategory'},
        {name: 'description', content: 'List of dbo.vwClientsCountryCategory'},
        {name: 'robots', content: 'index, follow'}
      ]);

   }

  ngOnInit(): void {
	  this.mainService.GetAll().subscribe(it=>{
    this.rows=it;
    this.dataSource = new MatTableDataSource(it);
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;

    });
  }
  public applyFilter(event: Event) {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }

      }
      