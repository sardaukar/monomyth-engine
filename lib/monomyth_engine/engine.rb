require_relative 'config'
require_relative 'loader'

module MonomythEngine
  class Engine < ::Rails::Engine
    isolate_namespace MonomythEngine
  end
end

