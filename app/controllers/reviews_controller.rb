class ReviewsController < ApplicationController

    def new
        @review = Review.new 
        @review.build_book  
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

    def edit
        current_review 
    end 

    def update
        current_review
        if @review.update(review_params)
            redirect_to @review
        else 
            render :edit 
        end 
    end 

    private 

    def current_review 
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:rating, :content, book_attributes: [:title,:author])
    end 

end
