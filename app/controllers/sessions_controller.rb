class SessionsController < ApplicationController
  def create
    render test: request.env['omniauth.auth'].inspect
  end
end
