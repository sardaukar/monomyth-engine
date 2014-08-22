module MonomythEngine
  class Config

    attr_reader :facade_file

    def initialize
      #defaults
      @facade_file = 'config/facades.yml'
      @default_format = :json
    end

    def facade_file=(value)
      @facade_file = value
    end

    def default_format=(value)
      @default_format = value
    end


  end
end