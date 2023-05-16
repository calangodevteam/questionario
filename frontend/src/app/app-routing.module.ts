import { CreateQuestaoComponent } from './pages/create-questao/create-questao.component';
import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { HomeComponent } from './pages/home/home.component';
import { ListQuestionsComponent } from './pages/list-questions/list-questions.component';
import { PageNotFoundComponent } from './pages/page-not-found/page-not-found.component';
import { LoginComponent } from './pages/login/login.component';
import { LoginMemoriaService } from './services/login.memoria.service';
import { CreateQuestionarioComponent } from './pages/create-questionario/create-questionario.component';
import { ListQuestionarioComponent } from './pages/list-questionario/list-questionario.component';

const routes: Routes = [
  {path: 'home', component: HomeComponent, canActivate: [LoginMemoriaService] },
  {path: 'questoes', component: ListQuestionsComponent, canActivate: [LoginMemoriaService] },
  {path: 'questionarios', component: ListQuestionarioComponent, canActivate: [LoginMemoriaService] },
  {path: 'questionarios/create', component: CreateQuestionarioComponent, canActivate: [LoginMemoriaService] },
  {path: 'questoes/create', component: CreateQuestaoComponent, canActivate: [LoginMemoriaService] },
  { path: '', redirectTo: '/home', pathMatch: 'full'},
  {path: 'login', component: LoginComponent},
   {path: '**', component: PageNotFoundComponent},
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
