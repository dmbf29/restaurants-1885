import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="character-counter"
export default class extends Controller {
  static targets = ["input", "counter"];

  connect() {}

  count() {
    // we need the input
    // we want to count the num of characters in the input
    const number = this.inputTarget.value.length;
    // put the num of characters on the page
    this.counterTarget.innerText = `${number} characters`;
  }
}
