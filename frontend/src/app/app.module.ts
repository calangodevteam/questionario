import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';

import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatButtonModule } from '@angular/material/button';
import { MatDialogModule } from '@angular/material/dialog';
import {MatProgressBarModule} from '@angular/material/progress-bar';
import {MatProgressSpinnerModule} from '@angular/material/progress-spinner';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

import { HeaderComponent } from './components/header/header.component';
import { FooterComponent } from './components/footer/footer.component';
import { RegisterUserComponent } from './components/register-user/register-user.component';
import { AreasComponent } from './components/areas/areas.component';
import { ListAreasComponent } from './components/list-areas/list-areas.component';
import { QuestaoFormComponent } from './components/questao-form/questao-form.component';
import { QuestionarioFormComponent } from './components/questionario-form/questionario-form.component';
import { DropdownQuestoesComponent } from './components/dropdown-questoes/dropdown-questoes.component';

import { HomeComponent } from './pages/home/home.component';
import { ListQuestionsComponent } from './pages/list-questions/list-questions.component';
import { PageNotFoundComponent } from './pages/page-not-found/page-not-found.component';
import { LoginComponent } from './pages/login/login.component';
import { CreateQuestionarioComponent } from './pages/create-questionario/create-questionario.component';
import { ListQuestionarioComponent } from './pages/list-questionario/list-questionario.component';
import { CreateQuestaoComponent } from './pages/create-questao/create-questao.component';

import { LoginMemoriaService } from './services/login.memoria.service';
import { QuestaoCardComponent } from './components/questao-card/questao-card.component';
import { QuestionarioCardComponent } from './components/questionario-card/questionario-card.component';

import { ModalSelecaoTemaComponent } from './components/paginacao/modal-selecao-tema.component';
import { CarregadorElementosComponent } from './components/paginacao/carregador-elementos.component';
import { OrdenadorRecentesComponent } from './components/paginacao/ordenador-recentes.component';


@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    HomeComponent,
    ListQuestionsComponent,
    PageNotFoundComponent,
    LoginComponent,
    RegisterUserComponent,
    CreateQuestionarioComponent,
    ListQuestionarioComponent,
    AreasComponent,
    ListAreasComponent,
    CreateQuestaoComponent,
    QuestaoFormComponent,
    QuestionarioFormComponent,
    DropdownQuestoesComponent,
    QuestaoCardComponent,
    QuestionarioCardComponent,
    ModalSelecaoTemaComponent,
    CarregadorElementosComponent,
    OrdenadorRecentesComponent
    
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    FormsModule,
    ReactiveFormsModule,
    HttpClientModule,

    MatFormFieldModule,
    MatInputModule,
    MatButtonModule,
    MatDialogModule,
    MatProgressBarModule,
    MatProgressSpinnerModule,
  ],
  providers: [LoginMemoriaService],
  bootstrap: [AppComponent]
})
export class AppModule { }