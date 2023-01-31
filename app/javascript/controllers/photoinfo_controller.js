import { Controller } from "@hotwired/stimulus"

let count = 0
// Connects to data-controller="photoinfo"
export default class extends Controller {
  static targets = ["photoinfo"]

  connect() {
    console.log("you did it you sexy bitch")
  }

  nextInfo(event) {
    let OgCount = count
    count ++
    this.photoinfoTargets.forEach((element) => {
      if(element.classList.contains('photo-info-active') === true) {
        element.classList.remove('photo-info-active');
      }
    });
    this.photoinfoTargets[OgCount].classList.add('photo-info-inactive');
    this.photoinfoTargets[count].classList.remove('photo-info-inactive')
    this.photoinfoTargets[count].classList.add('photo-info-active')
    console.log(OgCount)
    console.log(count)
    console.log(this.photoinfoTargets)
  }
}
