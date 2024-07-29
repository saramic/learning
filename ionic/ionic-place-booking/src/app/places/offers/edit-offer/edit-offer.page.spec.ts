import { ComponentFixture, TestBed } from '@angular/core/testing';
import { EditOfferPage } from './edit-offer.page';

describe('EditOfferPage', () => {
  let component: EditOfferPage;
  let fixture: ComponentFixture<EditOfferPage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(EditOfferPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
