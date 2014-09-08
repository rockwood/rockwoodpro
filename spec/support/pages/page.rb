class Page
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  def has_success_flash?
    has_css?('.alert-success')
  end

  def has_error_flash?
    has_css?('.alert-error')
  end

  def test_selector(selector)
    "[data-test=#{selector}]"
  end
end
