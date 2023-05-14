import { HttpClient } from '@angular/common/http';
import { Component, Input } from '@angular/core';
import { RestElementsInfinitescrollService } from 'src/app/services/rest.elements.infinitescroll.service';

@Component({
  selector: 'app-carregador-elementos',
  templateUrl: './carregador-elementos.component.html'
})
export class CarregadorElementosComponent<T> {

  @Input() restElementsInfinitescrollService: RestElementsInfinitescrollService<T>;

  constructor(private http: HttpClient) {
    this.restElementsInfinitescrollService = new RestElementsInfinitescrollService(http);
  }

}
