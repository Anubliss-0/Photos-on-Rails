import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  static targets = ["mobileLinks", "navbar"]
  connect() {
    console.log("hello from navbar!")
  }

  // menu() {
  //   console.log("firing")
  //   if (this.mobileLinksTarget.style.left == "100vw") {
  //     this.mobileLinksTarget.style.left  = "0vw"
  //   } else {
  //     this.mobileLinksTarget.style.left = "100vw"
  //   }
  // }

  updateNavbar() {
    if (window.scrollY >= window.innerHeight) {
      this.navbarTarget.classList.add("navbar-normal")
    } else {
      this.navbarTarget.classList.remove("navbar-home")
    }
  }
}
