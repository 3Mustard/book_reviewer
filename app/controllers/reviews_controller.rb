class ReviewsController < ApplicationController

    def show 
        current_review
    end 

    private 

    def current_review 
        @review = Review.find(params[:id])
    end
end
