import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  classes = ["border-bottom","border-primary"]

  connect() {
    console.log("hello from navbar_controller");
  }

  addClass(c) {
    this.element.classList.add(c)
  }

  removeClass(c) {
    this.element.classList.remove(c)
  }

  updateNavbar() {
    if (window.scrollY >= 0.5 * window.innerHeight) {
      this.classes.forEach((c) => {
        this.element.classList.add(c)
      })
    } else {
      this.classes.forEach((c) => {
        this.element.classList.remove(c)
      })
    }
  }




}
