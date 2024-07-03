import { ComponentFixture, TestBed } from '@angular/core/testing';
import { RecipiesPage } from './recipies.page';

describe('RecipiesPage', () => {
  let component: RecipiesPage;
  let fixture: ComponentFixture<RecipiesPage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(RecipiesPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
