import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["title", "form"]
  static values = { submitUrl: String }
  connect() {
    console.log("HelloController")
  }

  submit() {
    console.log("Button clicked")
    console.log(this.submitUrlValue)
    this.formTarget.action = this.submitUrlValue
  }
}
