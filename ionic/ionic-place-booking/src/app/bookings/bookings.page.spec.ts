import { ComponentFixture, TestBed } from '@angular/core/testing';
import { BookingsPage } from './bookings.page';

describe('BookingsPage', () => {
  let component: BookingsPage;
  let fixture: ComponentFixture<BookingsPage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(BookingsPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
