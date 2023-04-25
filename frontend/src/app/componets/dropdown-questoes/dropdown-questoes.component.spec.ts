import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DropdownQuestoesComponent } from './dropdown-questoes.component';

describe('DropdownQuestoesComponent', () => {
  let component: DropdownQuestoesComponent;
  let fixture: ComponentFixture<DropdownQuestoesComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DropdownQuestoesComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DropdownQuestoesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
