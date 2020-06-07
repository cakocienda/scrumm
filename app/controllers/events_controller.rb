$turnnum = 0
$numarray = Array.new(36)
$problemarray = Array.new(12)
class EventsController < ApplicationController
  def index
    @events = Event.all
	@event = Event.first
	@event.update_attribute(:epint, $turnnum)
  end
  def show
    
    @event = Event.find(params[:id])
	dice = roll_dice()
	@event.update_attribute(:ep2int, dice)
	worknum = draw_card($turnnum, dice)
	if worknum == 0
	  $turnnum = $turnnum + 1
	  @event.update_attribute(:ep2string, "Health Problem- Skip your next turn")
	end
	if worknum == 1
	  dice2 = roll_dice()
	  dice = dice + dice2
	  @event.update_attribute(:ep2string, "New Recruit is good- Rolling 2 dice and adding to last roll")
	end
	if worknum == 2
	  @event.update_attribute(:ep2string, "A guru visited your office- You may immediately remove one problem card from the current story.")
	  for i in 1..10
	    @problem2 = Problem2.find(i)
		tester = @problem2.read_attribute(:epint)
		if tester == "1"
		  @problem2.update_attribute(:epint, 0)
		  break
		end
	  end
	end
	if worknum == 3
	  dice = dice + 3
	  @event.update_attribute(:ep2string, "The Boss acknowledges your effort.  You may add 3 points to the previous result")
	end
	if worknum == 4
	  dice = dice + 2
	  @event.update_attribute(:ep2string, "You worked well at home.  Add 2 points to your last roll.")
	end
	if worknum == 5
	  dice = 100
	  @event.update_attribute(:ep2string, "Your team found an easy way to accomplish the task.  A card in progress is instantly finished.")
	end
	if worknum == 6
	  dice = dice + 4
	  @event.update_attribute(:ep2string, "Things are going incrediably well.  Add 4 to the last roll.")
	end
	if worknum == 7
	  dice = dice - 1
	  @event.update_attribute(:ep2string, "It's your birthday and everyone stops to celebrate.  Subtract 1 from everyone's next roll.")
	end
	if worknum == 8
	  draw_card($turnnum, dice)
	  @event.update_attribute(:ep2string, "You worked overtime.  Draw another card and follow its instructions.")
	end
	if worknum == 9
	  $turnnum = $turnnum + 1
	  @event.update_attribute(:ep2string, "An emergency call - Everyone skips next turn.")
	end
	if worknum == 10
	  dice = dice - 4
	  @event.update_attribute(:ep2string, "The Project Owner decided to make changes to the project, so this story will take 4 hours more. ")
	end
	if worknum == 11
	  dice = -999
	  @event.update_attribute(:ep2string, "Hard drive crash! - Remove all progress from a card in progress.")
	end
	if worknum == 12
	  $turnnum = $turnnum + 1
	  @event.update_attribute(:ep2string, "You are sent on a Business Trip - skip next turn.")
	end
	if worknum == 13
	  dice = dice - 6
	  @event.update_attribute(:ep2string, "Your work costs more than planned.  Add 6 hours to the story estimation.")
	end
	if worknum == 14
	  @problem = Problem2.first
	  @problem.update_attribute(:num, 1)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #1: The specification is not clear enough for you.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 15
	  @problem = Problem2.second
	  @problem.update_attribute(:num, 2)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #2: You feel users are not satisfied.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 16
	  @problem = Problem2.third
	  @problem.update_attribute(:num, 3)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #3: You can't work with the story as you don't have important data from the Project Owner.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 17
	  @problem = Problem2.find(4)
	  @problem.update_attribute(:num, 4)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #4: Your work is blocked by a technical issue.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 18
	  @problem = Problem2.find(5)
	  @problem.update_attribute(:num, 5)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #5: You can not finish the story because the quality is inadequate.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 19
	  @problem = Problem2.find(6)
	  @problem.update_attribute(:num, 6)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #6: Today you are upset, so you can't get any work done.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 20
	  @problem = Problem2.find(7)
	  @problem.update_attribute(:num, 7)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #7: You can not communicate well with other team members, they just don't get you.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 21
	  @problem = Problem2.find(8)
	  @problem.update_attribute(:num, 8)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #8: You are not skilled enough to finish the work.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 22
	  @problem = Problem2.find(9)
	  @problem.update_attribute(:num, 9)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #9: The system is very unstable and keeps crashing.  You can't test your code.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 23
	  @problem = Problem2.find(10)
	  @problem.update_attribute(:num, 10)
	  @problem.update_attribute(:epint, @event.id)
	  @event.update_attribute(:ep2string, "Problem Card #10: Your colleague provided you with a component that is different than you expected.  You can't proceed.")
	  $problemarray.insert(@event.id - 1, $problemarray[@event.id - 1] + 1)
	end
	if worknum == 24
	  @solution = Solution2.find(1)
	  @solution.update_attribute(:num, 1)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #1: Get some rest to refresh your mind.")
	end
	if worknum == 25
	  @solution = Solution2.find(2)
	  @solution.update_attribute(:num, 2)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #2: Add another member to your team - throw dice once per round extra at any time during the round.")
	end
	if worknum == 26
	  @solution = Solution2.find(3)
	  @solution.update_attribute(:num, 3)
	  @solution.update_attribute(:epint, 1)
      @event.update_attribute(:ep2string, "Solution Card #3: Engage a specialist.")
	end
	if worknum == 27
	  @solution = Solution2.find(4)
	  @solution.update_attribute(:num, 4)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #4: Apply your insight.")
	end
	if worknum == 28
	  @solution = Solution2.find(5)
	  @solution.update_attribute(:num, 5)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #5: Introduce automated testing.")
	end
	if worknum == 29
	  @solution = Solution2.find(6)
	  @solution.update_attribute(:num, 6)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #6: Involve a skilled team member from another team.")
	end
	if worknum == 30
	  @solution = Solution2.find(7)
	  @solution.update_attribute(:num, 7)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #7: Get the team together with the Project Owner and exchange important information.")
	end
	if worknum == 31
	  @solution = Solution2.find(8)
	  @solution.update_attribute(:num, 8)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #8: Enhance communications.")
	end
	if worknum == 32
	  @solution = Solution2.find(9)
	  @solution.update_attribute(:num, 9)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #9: Get the team together and share key project goals.")
	end
	if worknum == 33
	  @solution = Solution2.find(10)
	  @solution.update_attribute(:num, 10)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #10: Your boss is ready to take part of the work.")
	end
	if worknum == 34
	  @solution = Solution2.find(11)
	  @solution.update_attribute(:num, 11)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #11: Take training to raise the level of your skills.")
	end
	if worknum == 35
	  @solution = Solution2.find(12)
	  @solution.update_attribute(:num, 12)
	  @solution.update_attribute(:epint, 1)
	  @event.update_attribute(:ep2string, "Solution Card #12: Apply pair programming.")
	end
	add_to_work(dice)
	$turnnum = $turnnum + 1
	@event.update_attribute(:epint, $turnnum)
	
	#Redirect to a game over screen
	if $turnnum >= $numplayers * 3
        redirect_to new_event_path
	end
  end
  def new
  end
  def edit
    @event = Event.find(params[:id])
	
  end

  def create
    @event = Event.new(article_params)
 
    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end
 def update
  @event = Event.find(params[:id])
 
  if @event.update(article_params)
    redirect_to @event
  else
    render 'edit'
  end
end
  private
    def article_params
      params.require(:event).permit(:num, :work, :epstring, :epint, :ep2string, :ep2int)
    end
	
 def roll_dice()
    number = rand(10)
	number = number + 2
    if $extradice == 1
	  number = number + rand(6)
	  $extradice = 0
	end

	return number
  end
  def add_to_work(amount)
    @event = Event.find(params[:id])

	currentwork = @event.work
	temp = currentwork
	if amount != -1 and amount != -999
	  currentwork = currentwork - amount
	  
	#Drew the reset work to original amount card!
	elsif amount == -999
	  for j in 1..12
	    @story = Event.find(j)
		number = @story.read_attribute(:num)
		if number == 1
		  @story.update_attribute(:work, 24)
		end
		if number == 2
		  @story.update_attribute(:work, 21)
		end
		if number == 3
		  @story.update_attribute(:work, 27)
		end
		if number == 4
		  @story.update_attribute(:work, 30)
		end
		if number == 5
		  @story.update_attribute(:work, 16)
		end
		if number == 6
		  @story.update_attribute(:work, 24)
		end
		if number == 7
		  @story.update_attribute(:work, 43)
		end
		if number == 8
		  @story.update_attribute(:work, 23)
		end
		if number == 9
		  @story.update_attribute(:work, 36)
		end
		if number == 10
		  @story.update_attribute(:work, 68)
		end
		if number == 11
		  @story.update_attribute(:work, 28)
		end
		if number == 12
		  @story.update_attribute(:work, 24)
		end
	  end
	end
	@event.update_attribute(:work, currentwork)

	#Problems only prevent problems from being finshed, not preventing work from being done
    for i in 1..10
	  @problem = Problem2.find(i)
      tester = @problem.read_attribute(:epint)
	  if tester == @event.id && currentwork <= 0
	    @event.update_attribute(:work, 1)
	  end
	end

	
  end
  def draw_card(turn, dice)
    number = rand(36)
	while !stillInDeck(number)
	  number = rand(36)
	  if $numarray.length >= 36
	    reshuffle()
	  end
	end
	$numarray.push(number)
	return number
  end
  
  def stillInDeck(number)
    for i in 0..35
	  if $numarray[i] == number
	    return false
	  end
	end
	return true
  end
  
  def reshuffle()
    for i in 1..14
	  $numarray.delete(i)
	end
  end
  
end
