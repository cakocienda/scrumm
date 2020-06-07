class Solution2sController < ApplicationController
  def new
  end
  def edit
    @solution2s = Solution2.find(params[:id])

  end
  def index
    @solution2s = Solution2.all
	for i in 1..12
	  @solution2 = Solution2.find(i)
	  tester = @solution2.read_attribute(:ep2int)
	  isValid = validateSolution(tester, i)
	  if tester !=0 and isValid == 1
	    @solution2.update_attribute(:epint, 0)
		for j in 1..10
		  @problem2 = Problem2.find(j)
		  tester2 = @problem2.read_attribute(:num)
		  if tester == tester2 and @problem2.read_attribute(:epint) == 1
		    @problem2.update_attribute(:epint, 100)
		  end
		end
		@solution2.update_attribute(:ep2int, 2)
	  end
	  if isValid == 999
	    @solution2.update_attribute(:ep2int, 0)
	    redirect_to new_problem2_path
	  end
	  
	end
	if @solution2.read_attribute(:ep2int) != 0
	    @solution2.update_attribute(:epint, 0)
	end
  end
 
  def show
  end
  def create
    @solution2 = Solution2.new(article_params)
 
    @solution2.save
    redirect_to @solution2
  end
 def update
   @solution2 = Solution2.find(params[:id])
   @solution2.update(ep2int: params[:solution2][:ep2int])
   redirect_to solution2s_path(@solution2)
 end
 
  def validateSolution(inputnumber, number)
	if number == 1
	  if inputnumber == 7
	    return 1
	  end
	end
	if number == 2 and inputnumber == 2
	  return 999
	end
	if number == 3
	  if inputnumber == 1 or inputnumber == 5
	    return 1
	  end
	end
	if number == 4
	  if inputnumber == 3 or inputnumber == 10
	    return 1
	  end
	end
	if number == 5
	  if inputnumber == 5 or inputnumber == 10
	    return 1
	  end
	end
	if number == 6
	  if inputnumber == 6 or inputnumber == 9
	    return 1
	  end
	end
	if number == 7
	  if inputnumber == 2 or inputnumber == 4
	    return 1
	  end
	end
	if number == 8
	  if inputnumber == 2 or inputnumber == 8
	    return 1
	  end
	end
	if number == 9
	  if inputnumber == 4 or inputnumber == 7
	    return 1
	  end
	end
	if number == 10
	  if inputnumber == 8
	    return 1
	  end
	end
	if number == 11
	  if inputnumber == 9 or inputnumber == 11
	    return 1
	  end
	end
	if number == 12
	  if inputnumber == 3 or inputnumber == 6
	    return 1
	  end
	end
	return 0
  end
 
  private
    def article_params
      params.permit(:num, :epstring, :epint, :ep2string, :ep2int)
    end
  #private
    #def solution_params
	 # params.require(:solution2).permit(:ep2int)
	#end
end
