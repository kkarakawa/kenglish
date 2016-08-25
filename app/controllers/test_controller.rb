class TestController < ApplicationController
  def index
  end

  def show
    if params[:id].to_i > 0
      ids = (1..Question.count).to_a.sample(params[:id].to_i)
      @questions = Question.where(id: ids)
    elsif params[:id] == "incorrect"
      @questions = Question.order(incorrect: :desc).limit(10)
    end
  end

  def answer
    result = {}
    question = Question.find(params[:id])
    if convert_shorten(question[:answer]) == convert_shorten(params[:answer])
      result[:result] = "OK"
      question.correct += 1
      question.times = question.correct + question.incorrect
    else
      result[:result] = "NG"
      result[:answer] = question[:answer]
      question.incorrect += 1
      question.times = question.correct + question.incorrect
    end
    question.save
    render json: result
  end

  private

  def convert_shorten(str)
    list = Settings.shorten
    list.each do |key, value|
      str.gsub! /#{key}/, value
    end
    str
  end
end
