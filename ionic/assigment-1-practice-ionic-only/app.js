const courseName = document.querySelector("[data-testid=input-course-name]");
const courseRating = document.querySelector("[data-testid=input-course-rating]");
const addButton = document.querySelector("[data-testid=button-add-course]");
const coursesList = document.querySelector("[data-testid=courses-list]");

async function presentAlert() {
  const alert = document.createElement('ion-alert');
  alert.header = "Invalid inputs";
  alert.message = "Please enter valid course and rating between 1 - 5";
  alert.buttons = ["Okay"];

  document.body.appendChild(alert);
  await alert.present();
}

const clear = () => {
  courseName.value = "";
  courseRating.value = "";
}

addButton.addEventListener("click", () => {
  const enteredCourseName = courseName.value;
  const enteredCourseRating = courseRating.value;

  if (
    enteredCourseName.trim().length <= 0 ||
    enteredCourseRating <= 0 ||
    enteredCourseRating > 5 ||
    enteredCourseRating.trim().length <= 0
  ) {
    presentAlert();
    return;
  }

  const newItem = document.createElement("ion-item");
  newItem.textContent = enteredCourseName + ": " + enteredCourseRating;

  coursesList.appendChild(newItem);

  clear();
});