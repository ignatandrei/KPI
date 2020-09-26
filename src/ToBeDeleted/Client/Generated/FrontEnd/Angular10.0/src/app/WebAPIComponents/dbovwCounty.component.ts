import {Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';

import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Title, Meta } from '@angular/platform-browser';

import{ dbovwCounty } from './../WebAPIClasses/dbovwCounty';
import {dbovwCountyService} from './../services/dbovwCounty.service';

@Component({
  selector: 'app-dbovwCounty-component',
  templateUrl: './dbovwCounty.component.html',
  styleUrls: ['./dbovwCounty.component.css']
})
export class dbovwCountyComponent implements OnInit {

  displayedColumns: string[] = [ 'rowIndex' ,'idcountry','idcounty','namecountry','namecounty','shortnamecountry','shortnamecounty'    ];
  dataSource: MatTableDataSource<dbovwCounty>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  

  public rows:dbovwCounty[]=[];
  constructor(private mainService: dbovwCountyService, private router: Router,private titleService: Title,  private metaService: Meta  ) {
      this.titleService.setTitle('List of dbo.vwCounty');
      this.metaService.addTags([
        {name: 'keywords', content: 'dbo.vwCounty'},
        {name: 'description', content: 'List of dbo.vwCounty'},
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
      