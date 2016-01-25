class PeopleController < ApplicationController
  # Include Helpers
  include ApplicationHelper

  # GET /people
  # GET /people.json
  def index
    @people = User.all
  end

  # GET /people/1
  # GET /people/1.json
  def show
    @person = User.find
  end

  # GET /people/:partial_name
  # GET /people/:partial_name.json
  def search
    @people = User.where('name LIKE ? AND role != ?', "%#{params[:partial_name]}%", role(:admin)[:id])
  end
end