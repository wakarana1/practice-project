# frozen_string_literal: true

class ApplicationController < ActionController::API
  include ActionController::RequestForgeryProtection
  protect_from_forgery

  private

  def  protect_from_forgery; end
end
