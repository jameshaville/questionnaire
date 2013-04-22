class FormsController < ApplicationController
  def index
  	# This is a comment
  	@name = "James"
  	@location = "Clerkenwell"
  	@now = Time.now
  	@message = "Welcome to #{@location}, #{@name}"

  	# This is an array
  	@list = ['name1', 'name2', 'name3', 'name4']

  	@competition_won_by_sev = true
    @sev_votes = rand(100)
    @mark_votes = rand(100)

    if @sev_votes > @mark_votes
  	  @list << "Sev"
    elsif @sev_votes == @mark_votes
      @list << "Sev"
      @list << "Mark"
    else
      @list << "Mark"
    end

    @forms = Form.all
  end

  def show
    @form = Form.find(params[:id])
  end

  def new
    @form = Form.new
  end

  def create
    @form = Form.new(params[:form])

    if @form.save
      #Add this message to the next page
      flash[:success] = "Yay, you've added #{@form.name}!"
      redirect_to forms_path
    else
      render "new" #redirect will lose the data
    end
  end

  def edit
    @form = Form.find params[:id]
  end

  def update
    @form = Form.find params[:id]
    if @form.update_attributes(params[:form])
      flash[:success] = "You have successfully updated the form!"
      redirect_to forms_path(@form)
    else
      render "edit"
    end 
  end

  def destroy
    @form = Form.find params[:id]
    @form.destroy
    flash[:success] = "You have successfully deleted #{@form.name}!"
    redirect_to forms_path
  end

end


#if @sev_votes > @mark_votes
 #     @list << "Sev"
 #   else
 #     @list << "Mark"
 #   end