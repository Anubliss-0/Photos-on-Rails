import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photoinfo"
export default class extends Controller {
  static targets = ["photoinfo"]
  connect() {
    console.log("you did it you sexy bitch")
  }

  nextInfo() {
    console.log("clicked")
  }
}
