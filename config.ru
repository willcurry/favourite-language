$: << File.expand_path('lib', File.dirname(__FILE__))

require "controllers/application_controller"
require "controllers/languages_controller"

raise "GITHUB_ACCESS_TOKEN is not set" unless ENV['GITHUB_ACCESS_TOKEN']

map("/") {run ApplicationController}
map("/languages") {run LanguagesController}
