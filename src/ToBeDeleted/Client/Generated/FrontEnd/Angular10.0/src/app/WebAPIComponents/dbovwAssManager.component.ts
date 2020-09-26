import {Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';

import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Title, Meta } from '@angular/platform-browser';

import{ dbovwAssManager } from './../WebAPIClasses/dbovwAssManager';
import {dbovwAssManagerService} from './../services/dbovwAssManager.service';

@Component({
  selector: 'app-dbovwAssManager-component',
  templateUrl: './dbovwAssManager.component.html',
  styleUrls: ['./dbovwAssManager.component.css']
})
export class dbovwAssManagerComponent implements OnInit {

  displayedColumns: string[] = [ 'rowIndex' ,'idassva','idmanager','manager','nameassva','shortmanager','shortnameassva'    ];
  dataSource: MatTableDataSource<dbovwAssManager>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  

  public rows:dbovwAssManager[]=[];
  constructor(private mainService: dbovwAssManagerService, private router: Router,private titleService: Title,  private metaService: Meta  ) {
      this.titleService.setTitle('List of dbo.vwAssManager');
      this.metaService.addTags([
        {name: 'keywords', content: 'dbo.vwAssManager'},
        {name: 'description', content: 'List of dbo.vwAssManager'},
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
      