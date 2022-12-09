class RecruitmentsController < ApplicationController
  before_action :authenticate_user!
  def index
    @recruitments = Recruitment.all
  end
  def new
    @recruitment=Recruitment.new
  end
  def create 
    recruitment = Recruitment.new(recruitment_params)
    recruitment.user_id = current_user.id
    recruitment.participants = 1
    if recruitment.save
      UserRecruitment.create!(user_id: current_user.id,recruitment_id: recruitment.id)
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  
  def show
    @recruitment = Recruitment.find(params[:id])
  end


  def destroy
    recruitment = Recruitment.find(params[:id])
    recruitment.destroy
    redirect_to action: :index
  end
  def join
    UserRecruitment.create!(user_id: params[:unnchi],recruitment_id: params[:recruitment_id])
    ChatMessage.create!(user_id: current_user.id,recruitment_id: params[:recruitment_id],message: "#{current_user.name}が入室しました", anounce: true)
    recruitment = Recruitment.find(params[:id])
    recruitment.participants = recruitment.participants + 1
    recruitment.update!(participants: recruitment.participants)
    redirect_to :action => "show", :id => params[:recruitment_id]
    
    
  end
  def leave

    UserRecruitment.find_by(user_id: params[:box],recruitment_id: params[:recruitment_id]).destroy!

    if params[:removed_user_name].present?
      ChatMessage.create!(user_id: current_user.id,recruitment_id: params[:recruitment_id],message: "#{params[:removed_user_name]}が#{params[:admin_user_name]}によって削除されました", anounce: true)
    else
      ChatMessage.create!(user_id: current_user.id,recruitment_id: params[:recruitment_id],message: "#{current_user.name}が退出しました", anounce: true)
    end
    
    recruitment = Recruitment.find(params[:id])
    recruitment.participants = recruitment.participants - 1
    recruitment.update!(participants: recruitment.participants)
    redirect_to :action => "show", :id => params[:recruitment_id]
  end

  private
  def recruitment_params
    params.require(:recruitment).permit(:datetime)
  end
  
  
  
  
  
  # def new
  #   @recruitment = Form::Recruitment.new
  # end

  # def create
  #   @recruitment = Form::Recruitment.new(recruitment_params)
  # end

  # private

  # def recruitment_params
  #   params
  #     .require(:form_recruitment)
  #     .permit(Form::Recruitment::REGISTRABLE_ATTRIBUTES)
  # end
end

  
  

  # def user_recruitment_params
  #   params.permit(:user_id, recruitment_id)
  # end

