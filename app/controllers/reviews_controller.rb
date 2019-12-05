class ReviewsController < ApplicationController

    def index 
        @reviews = Review.all 
    end 
    #associate this review to the current user
    def new
        @review = Review.new 
        @review.build_book 
    end 

    def create 
        @review = review.new(review_params)

        if @review.valid? 
            @review.save 
            redirect_to review_review_path(@review)
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
        @review = review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:rating, :content, book_attributes: [:author,:title,:genre])
    end 
end
