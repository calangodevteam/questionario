import { Component, Input } from '@angular/core';
import { Questionario } from 'src/app/model/questionario';

@Component({
  selector: 'app-questionario-card',
  templateUrl: './questionario-card.component.html',
  styleUrls: ['./questionario-card.component.css']
})
export class QuestionarioCardComponent {

  @Input() questionario!:Questionario;

  private getDataLocal(data: string): Date{
    let dataUTC = new Date(data);
    let dataLocal = new Date(Date.UTC(dataUTC.getFullYear(), dataUTC.getMonth(), dataUTC.getDate(), 
      dataUTC.getHours(), dataUTC.getMinutes(), dataUTC.getSeconds()));
      return dataLocal;
  }

  private getDataAcrescida(data: string, minutos: number): Date {
    let dataLocalAcrescida = this.getDataLocal(data);
    dataLocalAcrescida.setTime(dataLocalAcrescida.getTime() + (minutos * 60 * 1000));

    return dataLocalAcrescida;
  }

  isPrazoEncerrado(data: string, minutos: number): boolean{
    return new Date(this.getDataAcrescida(data, minutos)).getTime() < new Date(Date.now()).getTime();
  }
  
  getDataFormatada(data: string): string {
    return this.getDataLocal(data).toLocaleString('pt-BR');
  }

  getDataFormatadaAcrescida(data: string, minutos: number): string {
    return this.getDataAcrescida(data, minutos).toLocaleString('pt-BR');
  }
}