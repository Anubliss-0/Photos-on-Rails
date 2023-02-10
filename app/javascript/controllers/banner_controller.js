import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="banner"
export default class extends Controller {
  static targets = ["collections"]

  connect() {
  }

  autoScroll(event) {
    event.preventDefault()
    this.collectionsTarget.scrollIntoView(true)
  }
}
