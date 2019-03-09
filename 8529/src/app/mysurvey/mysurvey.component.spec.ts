import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MysurveyComponent } from './mysurvey.component';

describe('MysurveyComponent', () => {
  let component: MysurveyComponent;
  let fixture: ComponentFixture<MysurveyComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MysurveyComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MysurveyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
