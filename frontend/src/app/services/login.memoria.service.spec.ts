import { TestBed } from '@angular/core/testing';

import { LoginMemoriaService } from './login.memoria.service';

describe('LoginMemoriaService', () => {
  let service: LoginMemoriaService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(LoginMemoriaService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
