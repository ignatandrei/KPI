
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { Client } from '../WebAPIClasses/Client';
import { ClientService } from '../services/Client.service';
@Component({
  selector: 'app-Clientedit',
  templateUrl: './Clientedit.component.html',
  styleUrls: ['./Clientedit.component.css']
})
export class ClientEditComponent implements OnInit {

  public id: number;
  public dataToEdit: Client;
  constructor(private route: ActivatedRoute , private router: Router, private mainService: ClientService ) {

    // route.paramMap.subscribe(params=>{
    //   this.id = +params.get('id');
    // });

   }

  ngOnInit(): void {
    this.route.paramMap.pipe(
      tap(params => this.id = +params.get('id') ),
      switchMap(it => this.mainService.Get(this.id) ),
      delay(1000),
      tap(it => this.dataToEdit = it)
      )
  .subscribe();

  }
  public save(): void{
	const data=new Client(this.dataToEdit);
    this.mainService.Update(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/client']);
  }


}
