class ReviewsController < ApplicationController
    before_action :current_review, only: [:show,:edit,:update]
    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    #index of a users reviews
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
        #if current_user.id == @review.user_id 
        if @review.valid? 
            @review.save 
            redirect_to book_path(@review.book_id)
        else 
            render :new  
        end 
    end 

    def edit
    end 

    def update
        if review_belongs_to_user? && @review.update(review_params)
            redirect_to book_path(@review.book_id)
        else 
            render :edit 
        end 
    end 

    def destroy
        @review = Review.find(params[:id])
        if review_belongs_to_user?
            @review.destroy 
            redirect_to reviews_path
        end  
    end 

    private 

    def handle_record_not_found 
        redirect_to books_path
    end 

    def current_review 
        @review = Review.find(params[:id])
    end

    def review_belongs_to_user?
        @review.user_id == current_user.id
    end 

    def review_params
        params.require(:review).permit(:rating, :content, :book_id)
    end 
end
