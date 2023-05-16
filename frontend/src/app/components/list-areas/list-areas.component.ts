import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
//import { Areas } from 'src/app/model/areas';
import { AreasService } from 'src/app/services/areas.service';

@Component({
  selector: 'app-list-areas',
  templateUrl: './list-areas.component.html',
  styleUrls: ['./list-areas.component.css']
})
export class ListAreasComponent implements OnInit{
  router: Router;
  servicoAreas: AreasService;
  areaId: number = 0;
  //areas: Areas[] = [];

  constructor(router: Router, servicoAreas: AreasService) {
      this.router = router;
      this.servicoAreas = servicoAreas;
   }

  private obterAreas(){
    //this.servicoAreas.obterAreas()
        //.subscribe((areas)=>this.areas=areas);
  }

  ngOnInit(): void {
    this.obterAreas();
  }
}
