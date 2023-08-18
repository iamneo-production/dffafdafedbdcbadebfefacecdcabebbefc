import { TestBed } from '@angular/core/testing';

import { AdminService } from './admin.service';
import { HttpClientTestingModule } from '@angular/common/http/testing';

describe('AdminService', () => {
  let service: AdminService;

  beforeEach(() => {
    TestBed.configureTestingModule({
      imports: [HttpClientTestingModule]
    });
    service = TestBed.inject(AdminService);
  });

  fit('Week5_Day3_should create AdminServices', () => {
    expect(service).toBeTruthy();
  });

  // fit("getteams Method exists", () => {
  //   expect(service.getTeams).toBeTruthy();
  // })
});
