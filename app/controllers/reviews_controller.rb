class ReviewsController < ApplicationController

    def index 
        @reviews = Review.all 
    end 

    def new
        @book = Book.find(params[:book_id])
        @review = @book.reviews.build
    end 

    def create #need to pass :book_id from new form to the create method here to tie a user to a book
        @review = current_user.reviews.build(review_params)

        if @review.valid? 
            @review.save 
            redirect_to show_book_path(@review.book_id) #not sure @review.book_id will render the show book path i want
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
        params.require(:review).permit(:rating, :content, :book_id, book_attributes: [:author,:title,:genre])
    end 
end
