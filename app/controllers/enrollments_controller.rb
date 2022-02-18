# frozen_string_literal: true
class EnrollmentsController < ApplicationController
  def new
    @enrollment = Enrollment.new
  end

  def create
    enrollment = Enrollment.create(enrollment_params)
    if enrollment.valid?
      redirect_to events_path
    end
  end

  def show
    @enrollment = Enrollment.find(params[:id])
  end

  private

  def enrollment_params
    params.require(:enrollment).permit(:user_id, :event_id)
  end
end
