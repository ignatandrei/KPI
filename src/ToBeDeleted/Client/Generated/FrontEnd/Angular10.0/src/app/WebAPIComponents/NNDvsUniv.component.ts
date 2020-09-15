import {Component, OnInit, ViewChild} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatSort} from '@angular/material/sort';
import {MatTableDataSource} from '@angular/material/table';

import { tap } from 'rxjs/operators';
import { Router } from '@angular/router';
import { NNDvsUniv } from './../WebAPIClasses/NNDvsUniv';
import {NNDvsUnivService} from './../services/NNDvsUniv.service';

@Component({
  selector: 'app-NNDvsUniv-component',
  templateUrl: './NNDvsUniv.component.html',
  styleUrls: ['./NNDvsUniv.component.css']
})
export class NNDvsUnivComponent implements OnInit {

  public displayedColumns: string[] = ['rowIndex' , 'salesrepname', 'noofcustomerswithshipment', 'universenooftotalcustomersfromsalesreparea', 'operations'];
  dataSource: MatTableDataSource<NNDvsUniv>;

  @ViewChild(MatPaginator, {static: true}) paginator: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort: MatSort;



  public rows: NNDvsUniv[] = [];
  constructor(private mainService: NNDvsUnivService, private router: Router ) { }

  ngOnInit(): void {
	  this.mainService.GetAll().subscribe(it => {
    this.rows = it;
    this.dataSource = new MatTableDataSource(it);
    this.dataSource.paginator = this.paginator;
    this.dataSource.sort = this.sort;

    });
  }
  public applyFilter(event: Event): void {
    const filterValue = (event.target as HTMLInputElement).value;
    this.dataSource.filter = filterValue.trim().toLowerCase();

    if (this.dataSource.paginator) {
      this.dataSource.paginator.firstPage();
    }
  }


  public deleteData(id: number): void{

    if (!window.confirm('do you want to delete row '+ id)){
      return;
    }

    this.mainService
    .Delete(id)
    .pipe(

      tap(idDeleted => {
    // const ndx = this.rows.findIndex(it=>it.id == idDeleted);
      // this.rows.splice(ndx,1);
      // this.dataSource = new MatTableDataSource(this.rows);
      const ndx = this.rows.findIndex(it => it.id20200915075727 === idDeleted);
      this.dataSource.data.splice(ndx, 1);
      this.dataSource._updateChangeSubscription();
    })
    )
    .subscribe();
  }
  public add(): void{
    this.router.navigate(['/nndvsuniv/add']);
    return;
  }

}