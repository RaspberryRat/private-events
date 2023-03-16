class AdmissionsController < ApplicationController
  before_action :authenticate_user!, only: [:update]

  def new
    # link event to user
    flash.now[:success] = "This path worked!"
    redirect_to new_admission_path
  end
end
