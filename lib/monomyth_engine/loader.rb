module MonomythEngine
  class Loader
    require 'yaml'

    attr_reader :facades

    def initialize
      @facades = parse_file(MonomythEngine.config.facade_file)
    end

    private

    def parse_file filename
      filepath = File.join( Rails.root, filename )
      raise 'Facades file not found!' unless File.exists?( filepath )

      YAML.load_file filepath
    end

  end
end