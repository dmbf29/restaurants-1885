import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    // this.element ?? -> where ever the controller is
    // add the flatpickr instance to our input
    flatpickr(this.element, {
      mode: "range",
    });
  }
}
