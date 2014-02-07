class VisitorsController < ApplicationController

  def new
    @visitor = Visitor.new
    #flash[:notice] = 'Welcome!'
    #flash[:alert] = 'My birthday is soon.'

  end

  def create
    @visitor = Visitor.new(secure_params)
    if @visitor.valid?
      @visitor.subscribe
      flash[:notice] = "Registrado #{@visitor.email} en la lista del boletin informativo."
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:visitor).permit(:email)
  end

end