import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NationalProfileComponent } from './national-profile.component';

describe('NationalProfileComponent', () => {
  let component: NationalProfileComponent;
  let fixture: ComponentFixture<NationalProfileComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NationalProfileComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NationalProfileComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
