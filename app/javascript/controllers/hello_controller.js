import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]
  static values = { submitUrl: String }
  connect() {
    console.log("HelloController")
  }

  submit(e) {
    if(this.submitUrlValue) {
      this.formTarget.action = this.submitUrlValue;
    }
  }
}

