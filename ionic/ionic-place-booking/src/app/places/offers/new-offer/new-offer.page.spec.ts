import { ComponentFixture, TestBed } from '@angular/core/testing';
import { NewOfferPage } from './new-offer.page';

describe('NewOfferPage', () => {
  let component: NewOfferPage;
  let fixture: ComponentFixture<NewOfferPage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(NewOfferPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
