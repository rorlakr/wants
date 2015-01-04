class EngagesController < ApplicationController
  def create
    @engageable = params.keys.last.split('_')[0].capitalize.constantize.find params.values.last.to_i
    @engage = @engageable.engages.new(engage_params)
    @engage.user = current_user
    @engage.save

    respond_to do | format |
      format.js
    end
  end

  def destroy
    @engageable = params.keys[-2].split('_')[0].capitalize.constantize.find params.values[-2].to_i
    @engage = @engageable.engages.find(params.values.last.to_i)
    @engage.destroy

    respond_to do | format |
      format.js
    end
  end

  def update
  end

  private

  def engage_params
    params.require(:engage).permit(:content, :shared_profile)
  end
end
