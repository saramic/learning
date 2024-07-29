import { ComponentFixture, TestBed } from '@angular/core/testing';
import { PlaceDetailPage } from './place-detail.page';

describe('PlaceDetailPage', () => {
  let component: PlaceDetailPage;
  let fixture: ComponentFixture<PlaceDetailPage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(PlaceDetailPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
