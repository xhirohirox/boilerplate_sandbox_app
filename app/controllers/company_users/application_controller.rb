class CompanyUsers::ApplicationController < ApplicationController
  before_action :authenticate_company_user!
end
