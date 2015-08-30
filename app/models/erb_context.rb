# Used to make ERB variable binding easier
# http://stoneship.org/essays/erb-and-the-context-object/

class ERBContext
  include Rails.application.routes.url_helpers

  def initialize(hash)
    hash.each_pair do |key, value|
      instance_variable_set('@' + key.to_s, value)
    end
  end

  def get_binding
    binding
  end
end
