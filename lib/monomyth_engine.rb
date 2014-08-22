require "monomyth_engine/engine"

module MonomythEngine

  def self.config
    @config ||= Config.new
  end

  def self.configure
    yield config if block_given?
  end

  def self.facades
    Loader.new.facades
  end

end
