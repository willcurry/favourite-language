require_relative "lib/controllers/application_controller.rb"
require_relative "lib/controllers/languages_controller.rb"

map("/") {run ApplicationController}
map("/languages") {run LanguagesController}
