$originalvalue = 0
$numplayers = 0
class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end
  def new

  end
  def choose
    
  end
  def edit
    @article = Article.find(params[:id])
	
	
	#@commentt = @article.commentts

	#testnumber = @commentt.find(0).body
  end
  def show
    @article = Article.find(params[:id])
	$numplayers = @article.read_attribute(:work)
  end
  def create
    @article = Article.new(article_params)
	@event = Event.find(1)
	@event.update_attribute(:work, 24)
	@event = Event.find(2)
	@event.update_attribute(:work, 21)
	@event = Event.find(3)
	@event.update_attribute(:work, 27)
	@event = Event.find(4)
	@event.update_attribute(:work, 30)
	@event = Event.find(5)
	@event.update_attribute(:work, 16)
	@event = Event.find(6)
	@event.update_attribute(:work, 24)
	@event = Event.find(7)
	@event.update_attribute(:work, 43)
	@event = Event.find(8)
	@event.update_attribute(:work, 23)
	@event = Event.find(9)
	@event.update_attribute(:work, 36)
	@event = Event.find(10)
	@event.update_attribute(:work, 68)
	@event = Event.find(11)
	@event.update_attribute(:work, 28)
	@event = Event.find(12)
	@event.update_attribute(:work, 24)
    @problem = Problem2.find(1)
	@problem.update_attribute(:num, 1)
	@problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "The specification is not clear enough for you.") 
	@problem = Problem2.find(2)
	@problem.update_attribute(:num, 2)
	@problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "You feel users are not satisfied.")
	@problem = Problem2.find(3)
	@problem.update_attribute(:num, 3)
	@problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "You can't work with the story as you don't have important data from the Project Owner.")
	@problem = Problem2.find(4)
	@problem.update_attribute(:num, 4)
	@problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "Your work is blocked by a technical issue.")
    @problem = Problem2.find(5)
	@problem.update_attribute(:num, 5)
	@problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "You can not finish the story because the quality is inadequate.")
	@problem = Problem2.find(6)
	@problem.update_attribute(:num, 6)
    @problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "Today you are upset, so you can't get any work done.")
    @problem = Problem2.find(7)
	@problem.update_attribute(:num, 7)
    @problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "You can not communicate well with other team members, they just don't get you.")
	@problem = Problem2.find(8)
	@problem.update_attribute(:num, 8)
    @problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "You are not skilled enough to finish the work.")
	@problem = Problem2.find(9)
	@problem.update_attribute(:num, 9)
    @problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "The system is very unstable and keeps crashing.  You can't test your code.")
    @problem = Problem2.find(10)
	@problem.update_attribute(:num, 10)
    @problem.update_attribute(:epint, 0)
	@problem.update_attribute(:epstring, "Your colleague provided you with a component that is different than you expected.  You can't proceed.")
	@solution = Solution2.find(1)
	@solution.update_attribute(:num, 1)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Get some rest to refresh your mind.")
	@solution = Solution2.find(2)
	@solution.update_attribute(:num, 2)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Add another member to your team - thow dice once per round extra at any time during the round")
	@solution = Solution2.find(3)
	@solution.update_attribute(:num, 3)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
    @solution.update_attribute(:epstring, "Engage a specialist.")
	@solution = Solution2.find(4)
	@solution.update_attribute(:num, 4)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Apply your insight.")
	@solution = Solution2.find(5)
	@solution.update_attribute(:num, 5)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Introduce automated testing.")
	@solution = Solution2.find(6)
	@solution.update_attribute(:num, 6)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Involve a skilled team member from another team.")
	@solution = Solution2.find(7)
	@solution.update_attribute(:num, 7)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Get the team together with the Project Owner and exchange important information.")
	@solution = Solution2.find(8)
	@solution.update_attribute(:num, 8)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Enhance communications.")
	@solution = Solution2.find(9)
	@solution.update_attribute(:num, 9)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Get the team together and share key project goals.")
	@solution = Solution2.find(10)
	@solution.update_attribute(:num, 10)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Your boss is ready to take part of the work.")
	@solution = Solution2.find(11)
	@solution.update_attribute(:num, 11)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Take training to raise the level of your skills.")
	@solution = Solution2.find(12)
	@solution.update_attribute(:num, 12)
	@solution.update_attribute(:epint, 0)
	@solution.update_attribute(:ep2int, 0)
	@solution.update_attribute(:epstring, "Apply pair programming.")
    @article.save
	$turnnum = 0
    redirect_to @article
  end
 def update
  @article = Article.find(params[:id])
 
  if @article.update(article_params)
    redirect_to @article
  else
    render 'edit'
  end
end
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
 
    redirect_to articles_path
  end
  private
    def article_params
      params.require(:article).permit(:num, :work)
    end



end
