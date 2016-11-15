class HomeController < ApplicationController
  def index
    @stages = Item.where(stage: "staging")
  end
end
