import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["mobileLinks"]
  connect() {
    console.log("hello from navbar!")
  }

  menu() {
    console.log("firing")
    if (this.mobileLinksTarget.style.left == "100vw") {
      this.mobileLinksTarget.style.left  = "0vw"
    } else {
      this.mobileLinksTarget.style.left = "100vw"
    }
  }
}
