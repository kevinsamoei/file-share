class HomeController < ApplicationController
  def index
    if current_user
      @documents = current_user.documents
    end
  end
end
