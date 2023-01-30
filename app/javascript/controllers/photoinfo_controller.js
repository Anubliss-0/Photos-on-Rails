import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photoinfo"
export default class extends Controller {
  static targets = ["photoinfo"]

  connect() {
    console.log("you did it you sexy bitch")
  }


  nextInfo(event) {
    let indexes = []
    // let increment = count + 1;
    this.photoinfoTargets.forEach((element, index) => { if(element.classList.contains('photo-info-active') === true) {
      indexes.push(index)
    } })
    const toInt = indexes.reduce((accum, digit) => (accum * 10) + digit, 0);
    const nextIndex = toInt + 1
    // let number = this.photoinfoTargets.findIndex(this.photoinfoTarget.classList.contains('photo-info-active'))
    if(this.photoinfoTarget.classList.contains('photo-info-active') === true) {
      this.photoinfoTarget.classList.remove('photo-info-active')
      this.photoinfoTarget.classList.add('photo-info-inactive')
    }
    this.photoinfoTargets[nextIndex].classList.remove('photo-info-inactive')
    this.photoinfoTargets[nextIndex].classList.add('photo-info-active')
    console.log(nextIndex)
  }
}
