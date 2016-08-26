class SentenceController < ApplicationController
  before_action :set_cookies

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
  end

  private

  def set_cookies
    cookies.permanent[:bookmark] = "" if cookies[:bookmark].nil?
  end
end
