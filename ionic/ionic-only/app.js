const reasonInput = document.querySelector("#input-reason");
const amountInput = document.querySelector("#input-amount");
const cancelButton = document.querySelector("#btn-cancel");
const confirmButton = document.querySelector("#btn-confirm");
const expensesList = document.querySelector("#expenses-list");
const totalExpensesOutput = document.querySelector("#total-expenses");
// ion-alert-controller no longer a thing
//    https://ionicframework.com/docs/api/alert
// const alertController = document.querySelector("ion-alert-controller");

let totalExpenses = 0;

async function presentAlert() {
  const alert = document.createElement('ion-alert');
  alert.header = "Invalid inputs";
  alert.message = "Please enter valid reason and amount!";
  alert.buttons = ["Okay"];

  document.body.appendChild(alert);
  await alert.present();
}

const clear = () => {
  reasonInput.value = ''
  amountInput.value = ''
}

confirmButton.addEventListener("click", () => {
  // console.log("it works!");
  const enteredReason = reasonInput.value;
  const enteredAmount = amountInput.value;

  if (
    enteredReason.trim().length <= 0 ||
    enteredAmount <= 0 ||
    enteredAmount.trim().length <= 0
  ) {
    // alertController.create({
    //   message: "Please enter valid reason and amount!",
    //   header: "Invalid inputs",
    //   buttons: ["Okay"]
    // }).then(alertElement => {
    //   alertElement.present();
    // });
    presentAlert();

    return;
  }

  const newItem = document.createElement("ion-item");
  newItem.textContent = enteredReason + ": $" + enteredAmount;

  expensesList.appendChild(newItem);
  // console.log(enteredReason, enteredAmount);

  totalExpenses += +enteredAmount;
  totalExpensesOutput.textContent = totalExpenses;

  clear();
});

cancelButton.addEventListener("click", clear);
