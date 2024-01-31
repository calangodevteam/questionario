import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LoginWithJWTComponent } from './login-with-jwt.component';

describe('LoginWithJWTComponent', () => {
  let component: LoginWithJWTComponent;
  let fixture: ComponentFixture<LoginWithJWTComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [LoginWithJWTComponent]
    });
    fixture = TestBed.createComponent(LoginWithJWTComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
