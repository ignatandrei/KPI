
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { NNDvsUniv } from '../WebAPIClasses/NNDvsUniv';
import { NNDvsUnivService } from '../services/NNDvsUniv.service';
@Component({
  selector: 'app-NNDvsUnivadd',
  templateUrl: './NNDvsUnivadd.component.html',
  styleUrls: ['./NNDvsUnivadd.component.css']
})
export class NNDvsUnivAddComponent implements OnInit {

  
  public dataToAdd: NNDvsUniv;
  constructor( private router: Router, private mainService: NNDvsUnivService ) {

      this.dataToAdd = new NNDvsUniv();
   }

  ngOnInit(): void {
    
  }
  public add(): void{
	const data=new NNDvsUniv(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/nndvsuniv']);
  }


}
