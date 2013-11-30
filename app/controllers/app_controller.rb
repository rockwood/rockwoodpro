class AppController < ApplicationController
  before_filter :require_login
end