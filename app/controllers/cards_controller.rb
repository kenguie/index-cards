class CardsController < ApplicationController

	def create
		@project = Project.find(params[:project_id])
		@card = Card.create(title: "new card", body: "write something awesome here...", project_id: @project.id)
		redirect_to @project, notice: "new card added"
	end

	def update

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
