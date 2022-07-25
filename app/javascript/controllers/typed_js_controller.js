import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js'

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["Share the magic", "Share your movies", "Create new connections"],
      smartBackspace: true,
      typeSpeed: 100,
      startDelay: 1000,
      backSpeed: 100,
      backDelay: 500,
      loop: true
    });
  }
}
