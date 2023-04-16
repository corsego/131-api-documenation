class ApiTokensController < ApplicationController
  def index
    @api_tokens = current_user.api_tokens.order(created_at: :desc)
  end

  def create
    @api_token = current_user.api_tokens.create!
    respond_to do |format|
      format.turbo_stream
    end
  end

  def update
    @api_token = current_user.api_tokens.find(params[:id])
    @api_token.update(active: false)
    respond_to do |format|
      format.turbo_stream
    end
  end
end