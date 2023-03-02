class ConditionsController < ApplicationController
  def create
    run_and_render ::V1::Condition::Operation::Create
  end

  def calculate
    run_and_render ::V1::Condition::Operation::Calculate
  end
end
