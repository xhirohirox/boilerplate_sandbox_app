class CompanyUsers::RecruitmentsController < CompanyUsers::ApplicationController
  def index
    @recruitments = @company.recruitments
  end

  def show
  end

  def new
    @recruitment = Recruitment.new
  end

  def create
    recruitment = @company.recruitments.create(recruitment_params)
    if recruitment.save
      redirect_to company_users_recruitments_path
    else
    end
  end

  def recruitment_params
    params.require(:recruitment).permit(:name, :description, :income)
  end
end
