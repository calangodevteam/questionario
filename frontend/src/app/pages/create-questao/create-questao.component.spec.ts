import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CreateQuestaoComponent } from './create-questao.component';

describe('CreateQuestaoComponent', () => {
  let component: CreateQuestaoComponent;
  let fixture: ComponentFixture<CreateQuestaoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ CreateQuestaoComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(CreateQuestaoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
