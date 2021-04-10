# frozen_string_literal: true

class ApplicationController < ActionController::API
  include Response
  include HandlerException
end
