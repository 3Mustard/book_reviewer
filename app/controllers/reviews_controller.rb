class ReviewsController < ApplicationController
    before_action :current_review, only: [:show,:edit,:update]

    def index 
        @reviews = Review.all 
    end 

    def show 
    end 

    def new
        @book = Book.find(params[:book_id])
        @review = @book.reviews.build
    end 

    def create 
        #create a review with a book_id for the current user 
        @review = current_user.reviews.build(review_params)
        if current_user.id == @review.user_id 
            if @review.valid? 
                @review.save 
                redirect_to book_path(@review.book_id)
            else 
                render :new 
            end 
        end 
    end 

    def edit
    end 

    def update
        if @review.update(review_params)
            redirect_to book_path(@review.book_id)
        else 
            render :edit 
        end 
    end 

    private 

    def current_review 
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:rating, :content, :book_id)
    end 
end
