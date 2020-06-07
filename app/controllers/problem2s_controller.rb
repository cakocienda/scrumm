$extradice = 0
class Problem2sController < ApplicationController
  def new
    $extradice = 1
  end

  def index
    @problem2s = Problem2.all
	for i in 1..10
	  @problem2 = Problem2.find(i)
	  if @problem2.read_attribute(:epint) == "0"
	    @problem2.update_attribute(:integer, "No")
	  else
	    @problem2.update_attribute(:integer, "Yes")
	  end
	end

  end
 
  def show
    @problem2 = Problem2.find(params[:id])
  end
  def create
    @problem2 = Problem2.new(article_params)
 
    @problem2.save
    redirect_to @problem2
  end
 
 
  private
    def article_params
      params.require(:problem2).permit(:num, :epstring, :epint)
    end
end
