import {Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';

import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { Title, Meta } from '@angular/platform-browser';

import{ dboACTPL } from './../WebAPIClasses/dboACTPL';
import {dboACTPLService} from './../services/dboACTPL.service';

@Component({
  selector: 'app-dboACTPL-component',
  templateUrl: './dboACTPL.component.html',
  styleUrls: ['./dboACTPL.component.css']
})
export class dboACTPLComponent implements OnInit {

  displayedColumns: string[] = [ 'rowIndex' ,'actual','idactpl','idassvaclientscounties','month','plan','year'    ,'operations'];
  dataSource: MatTableDataSource<dboACTPL>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;

  

  public rows:dboACTPL[]=[];
  constructor(private mainService: dboACTPLService, private router: Router,private titleService: Title,  private metaService: Meta  ) {
      this.titleService.setTitle('List of dbo.ACTPL');
      this.metaService.addTags([
        {name: 'keywords', content: 'dbo.ACTPL'},
        {name: 'description', content: 'List of dbo.ACTPL'},
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
  

  public deleteData(id: number): void{

    if(!window.confirm("do you want to delete row "+ id)){
      return;
    }

    this.mainService
    .Delete(id)
    .pipe(
      
      tap(idDeleted=>{
    // const ndx = this.rows.findIndex(it=>it.id == idDeleted);
      // this.rows.splice(ndx,1);
      // this.dataSource = new MatTableDataSource(this.rows);
      const ndx = this.rows.findIndex(it => it.idactpl === idDeleted);
      this.dataSource.data.splice(ndx, 1);
      this.dataSource._updateChangeSubscription();
    })
    )
    .subscribe();
  }
  public add(): void{
    this.router.navigate(["/dboactpl/add"]);
    return;
  }

}
