import {Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';

import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Title, Meta } from '@angular/platform-browser';

import{ dbovwClientsBase } from './../WebAPIClasses/dbovwClientsBase';
import {dbovwClientsBaseService} from './../services/dbovwClientsBase.service';

@Component({
  selector: 'app-dbovwClientsBase-component',
  templateUrl: './dbovwClientsBase.component.html',
  styleUrls: ['./dbovwClientsBase.component.css']
})
export class dbovwClientsBaseComponent implements OnInit {

  displayedColumns: string[] = [ 'rowIndex' ,'id','idcategory','idclient','namecategory','nameclient','shortnamecategory','shortnameclient'    ];
  dataSource: MatTableDataSource<dbovwClientsBase>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  

  public rows:dbovwClientsBase[]=[];
  constructor(private mainService: dbovwClientsBaseService, private router: Router,private titleService: Title,  private metaService: Meta  ) {
      this.titleService.setTitle('List of dbo.vwClientsBase');
      this.metaService.addTags([
        {name: 'keywords', content: 'dbo.vwClientsBase'},
        {name: 'description', content: 'List of dbo.vwClientsBase'},
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
      