# frozen_string_literal: true

class Boltos::Bundle
  attr_reader :name

  def self.all(api = Boltos::API.new)
    api.get("bundles").collect { |hash| new hash["name"], api }
  end

  def self.create(name, api = Boltos::API.new)
    api.create_bundle name

    new name, api
  end

  def self.find_or_create(name, api = Boltos::API.new)
    all(api).detect { |bundle| bundle.name == name } || create(name, api)
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
