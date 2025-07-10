import "@hotwired/turbo-rails"
import "controllers"
import "flowbite"
import "alpinejs"

import { Application } from "@hotwired/stimulus"
import { definitionsFromContext } from "stimulus-loading"

const application = Application.start()
const context = require.context("controllers", true, /\.js$/)
application.load(definitionsFromContext(context))

import Alpine from "alpinejs"
window.Alpine = Alpine
Alpine.start()