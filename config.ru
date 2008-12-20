require "rubygems"
require "nyane"
require "nyane/erb"
require "models"

app = Nyane.new do
  load "app"
end

Task.auto_migrate!

use Rack::CommonLogger
use Rack::ShowExceptions

run app