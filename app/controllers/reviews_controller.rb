class ReviewsController < ApplicationController

    def new
        @review = Review.new 
        #build book variable?  
    end 

    def create 
        @review = Review.new(review_params)
        
        if @review.valid? 
            @review.save 
            redirect_to @review 
        else 
            render :new 
        end 
    end 

    def show 
        current_review
    end 

    private 

    def current_review 
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:rating, :content)
    end 

end
