module Routes
  class << self
    include Rails.application.routes.url_helpers
    include Routes::CustomPaths
  end

  include Rails.application.routes.url_helpers
  include Routes::CustomPaths

  def default_url_options
    Rails.application.routes.default_url_options
  end

  module CustomControllerPaths
    include CustomPaths

    def self.included(base)
      return unless base.respond_to? :helper_method

      instance_methods.each do |helper_method_name|
        base.helper_method helper_method_name.to_s
      end
    end
  end
end
