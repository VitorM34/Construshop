pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.1/dist/stimulus.js"
pin "stimulus-loading", to: "https://ga.jspm.io/npm:@hotwired/stimulus-loading@1.0.2/dist/stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"

pin "flowbite", to: "https://ga.jspm.io/npm:flowbite@3.1.2/dist/flowbite.js"
pin "@popperjs/core", to: "https://ga.jspm.io/npm:@popperjs/core@2.11.8/lib/index.js"
pin "alpinejs", to: "https://ga.jspm.io/npm:alpinejs@3.14.9/dist/module.esm.js"
