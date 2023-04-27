import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuestionarioCardComponent } from './questionario-card.component';

describe('QuestionarioCardComponent', () => {
  let component: QuestionarioCardComponent;
  let fixture: ComponentFixture<QuestionarioCardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ QuestionarioCardComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(QuestionarioCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
