class CompanyUsers::ApplicationController < ApplicationController
  before_action :authenticate_company_user!
  before_action :set_company

  def set_company
    @company = current_company_user.company
  end
end
