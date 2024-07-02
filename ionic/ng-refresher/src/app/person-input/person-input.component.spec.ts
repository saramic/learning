import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PersonInputComponent } from './person-input.component';

describe('PersonInputComponent', () => {
  let component: PersonInputComponent;
  let fixture: ComponentFixture<PersonInputComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PersonInputComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(PersonInputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
