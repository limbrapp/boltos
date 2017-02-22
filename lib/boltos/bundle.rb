class Boltos::Bundle
  attr_reader :name

  def self.create(name, api = nil)
    api    ||= Boltos::API.new
    response = api.create_bundle name

    new name, api
  end

  def initialize(name, api = nil)
    @name  = name
    @api   = api || Boltos::API.new
  end

  def set(key, value)
    api.put "/bundles/#{name}", "#{key}=#{value}"
  end

  def variables
    @variables ||= api.get "/bundles/#{name}"
  end

  private

  attr_reader :api
end
