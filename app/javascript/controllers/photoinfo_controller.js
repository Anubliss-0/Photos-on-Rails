import { Controller } from "@hotwired/stimulus"

let count = 0
// Connects to data-controller="photoinfo"
export default class extends Controller {
  static targets = ["photoinfo"]

  connect() {
    console.log("you did it you sexy bitch")
  }

  nextInfo() {
    if (count === this.photoinfoTargets.length-1 ){
      this.photoinfoTargets[count].classList.add('photo-info-inactive')
      count = 0
      this.photoinfoTargets[count].classList.remove('photo-info-inactive');
    } else {
    let ogCount = count
    count ++
    this.photoinfoTargets[ogCount].classList.add('photo-info-inactive');
    this.photoinfoTargets[count].classList.remove('photo-info-inactive')
    }
  }

  prevInfo() {
    if (count === 0){
      this.photoinfoTargets[count].classList.add('photo-info-inactive')
      count = this.photoinfoTargets.length-1
      this.photoinfoTargets[count].classList.remove('photo-info-inactive');
    } else {
    let ogCount = count
    count --
    this.photoinfoTargets[ogCount].classList.add('photo-info-inactive');
    this.photoinfoTargets[count].classList.remove('photo-info-inactive')
    }
  }
}
