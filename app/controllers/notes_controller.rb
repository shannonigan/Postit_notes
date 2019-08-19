class NotesController < ApplicationController
  def index
    @notes = Note.all 
  end



  def show
    @note = Note.find(params[:id])
  end



  def new
    @notes = Note.new
  end


  def create
    @notes = Note.new(notes_params)
    if @notes.save
     redirect_to notes_path
    else
      render :new
    end
  end


  def edit
    #render :edit
    @notes = Note.find(params[:id])
  
  end



  def update
    #update a page
    @notes = Note.find(params[:id])

    if @notes.update(notes_params)
      redirect_to note_path(@notes.id)
    else
      render :edit
    end
  end


def destroy
  Note.find(params[:id]).destroy
  redirect_to notes_path

end

  private
  def notes_params
  params.require(:note).permit(:title, :body)
  end

end
