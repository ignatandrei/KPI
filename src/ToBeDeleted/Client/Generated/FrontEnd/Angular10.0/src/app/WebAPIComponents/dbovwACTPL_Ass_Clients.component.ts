import {Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';

import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Title, Meta } from '@angular/platform-browser';

import{ dbovwACTPL_Ass_Clients } from './../WebAPIClasses/dbovwACTPL_Ass_Clients';
import {dbovwACTPL_Ass_ClientsService} from './../services/dbovwACTPL_Ass_Clients.service';

@Component({
  selector: 'app-dbovwACTPL_Ass_Clients-component',
  templateUrl: './dbovwACTPL_Ass_Clients.component.html',
  styleUrls: ['./dbovwACTPL_Ass_Clients.component.css']
})
export class dbovwACTPL_Ass_ClientsComponent implements OnInit {

  displayedColumns: string[] = [ 'rowIndex' ,'actual','idassva','idassvaclientscounties','idclient','idcounty','idmanager','month','nameassva','nameclient','namecountry','namecounty','plan','shortnameassva','shortnameclient','shortnamecountry','shortnamecounty','year'    ];
  dataSource: MatTableDataSource<dbovwACTPL_Ass_Clients>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  

  public rows:dbovwACTPL_Ass_Clients[]=[];
  constructor(private mainService: dbovwACTPL_Ass_ClientsService, private router: Router,private titleService: Title,  private metaService: Meta  ) {
      this.titleService.setTitle('List of dbo.vwACTPL_Ass_Clients');
      this.metaService.addTags([
        {name: 'keywords', content: 'dbo.vwACTPL_Ass_Clients'},
        {name: 'description', content: 'List of dbo.vwACTPL_Ass_Clients'},
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
      