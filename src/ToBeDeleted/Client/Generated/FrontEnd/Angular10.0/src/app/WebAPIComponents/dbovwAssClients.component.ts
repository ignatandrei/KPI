import {Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';

import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Title, Meta } from '@angular/platform-browser';

import{ dbovwAssClients } from './../WebAPIClasses/dbovwAssClients';
import {dbovwAssClientsService} from './../services/dbovwAssClients.service';

@Component({
  selector: 'app-dbovwAssClients-component',
  templateUrl: './dbovwAssClients.component.html',
  styleUrls: ['./dbovwAssClients.component.css']
})
export class dbovwAssClientsComponent implements OnInit {

  displayedColumns: string[] = [ 'rowIndex' ,'idassva','idassvaclientscounties','idclient','idcounty','idmanager','nameassva','nameclient','namecountry','namecounty','shortnameassva','shortnameclient','shortnamecountry','shortnamecounty'    ];
  dataSource: MatTableDataSource<dbovwAssClients>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  

  public rows:dbovwAssClients[]=[];
  constructor(private mainService: dbovwAssClientsService, private router: Router,private titleService: Title,  private metaService: Meta  ) {
      this.titleService.setTitle('List of dbo.vwAssClients');
      this.metaService.addTags([
        {name: 'keywords', content: 'dbo.vwAssClients'},
        {name: 'description', content: 'List of dbo.vwAssClients'},
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
      