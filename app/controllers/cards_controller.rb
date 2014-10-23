class CardsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@card = Card.create(title: "new card", body: "write something awesome here...", project_id: @project.id)
		respond_to do |format|
			format.html { redirect_to @project, notice: "new card added" }
			format.js
		end
	end

	def update
		@card = Card.find(params[:id])
		if @card.update(params.require(:card).permit(:title, :body))
	  		respond_to do |format|
	  			format.html { redirect_to @card.project, notice: 'Card successfully updated.' }
	      		format.json { respond_with_bip(@card) }
	  		end
	  	else
	  		respond_to do |format|
	  			format.html { redirect_to @card.project, notice: 'Something went wrong.' }
	      		format.json { respond_with_bip(@card) }
	  		end
	  	end
	end

	def destroy
		@card = Card.find(params[:id])
		@project = Project.find(params[:project_id])
		@card.destroy
		respond_to do |format|
			format.html { redirect_to @project, notice: "card was deleted" }
			format.js { head :no_content }
		end
	end
end
