import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photoinfo"
export default class extends Controller {
  static targets = ["photoinfo"]
  connect() {
    console.log("you did it you sexy bitch")
  }

  nextInfo() {
    console.log('test')
    this.photoinfoTarget.classList.add('red')
    // console.log("test")
    // if(this.photoinfoTarget.classList.contains('photo-info-active') === true) {
    //   this.photoinfoTarget.classList.remove('photo-info-active')
    // }
  }
}
