class ReviewsController < ApplicationController

    def index 
        @reviews = Review.all 
    end 

    def new
        @book = Book.find(params[:book_id])
        @review = @book.reviews.build
    end 

    def create 
        #create a review with a book_id for the current user 
        @review = current_user.reviews.build(review_params)

        if @review.valid? 
            @review.save 
            redirect_to book_path(@review.book_id)
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
        params.require(:review).permit(:rating, :content, :book_id)
    end 
end
