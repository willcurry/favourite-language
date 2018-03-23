$: << File.expand_path('lib', File.dirname(__FILE__))

require "controllers/application_controller"
require "controllers/languages_controller"

map("/") {run ApplicationController}
map("/languages") {run LanguagesController}
