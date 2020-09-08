
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { tap, delay, switchMapTo, switchMap } from 'rxjs/operators';
import { Client } from '../WebAPIClasses/Client';
import { ClientService } from '../services/Client.service';
@Component({
  selector: 'app-Clientadd',
  templateUrl: './Clientadd.component.html',
  styleUrls: ['./Clientadd.component.css']
})
export class ClientAddComponent implements OnInit {

  
  public dataToAdd: Client;
  constructor( private router: Router, private mainService: ClientService ) {

      this.dataToAdd = new Client();
   }

  ngOnInit(): void {
    
  }
  public add(): void{
	const data=new Client(this.dataToAdd);
    this.mainService.Insert(data).subscribe(
      it => {
        window.alert('saved !');
      }
    );
  }
  public cancel(): void{
    this.router.navigate(['/client']);
  }


}
