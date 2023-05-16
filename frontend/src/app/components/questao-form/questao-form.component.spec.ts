import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuestaoFormComponent } from './questao-form.component';

describe('QuestaoFormComponent', () => {
  let component: QuestaoFormComponent;
  let fixture: ComponentFixture<QuestaoFormComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ QuestaoFormComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(QuestaoFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
