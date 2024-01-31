import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CadastroUserJWTComponent } from './cadastro-user-jwt.component';

describe('CadastroUserJWTComponent', () => {
  let component: CadastroUserJWTComponent;
  let fixture: ComponentFixture<CadastroUserJWTComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CadastroUserJWTComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CadastroUserJWTComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
