class WelcomeController < ApplicationController
  def index
    get_reports
  end

  private
  def get_reports
    @users = User.all
  end
end
