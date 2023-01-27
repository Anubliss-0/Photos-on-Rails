import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photoinfo"
export default class extends Controller {
  static targets = ["photoinfo"]
  makeTargets() {

  }
  connect() {
    console.log("you did it you sexy bitch")
  }

  nextInfo() {

    let count = 0;
    let increment = count + 1;
    let classNeeded = `photo${increment}`
    if(this.photoinfoTarget.classList.contains('photo-info-active') === true) {
      this.photoinfoTarget.classList.remove('photo-info-active')
      this.photoinfoTarget.classList.add('photo-info-inactive')
    }
    this.photoinfoTargets[increment].classList.remove('photo-info-inactive')
    this.photoinfoTargets[increment].classList.add('photo-info-active')
    console.log(this.photoinfoTargets[increment])
  }
}
