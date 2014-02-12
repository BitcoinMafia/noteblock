class NotesController < ApplicationController
  def index
  end

  def show
  end

  def create
    ap "CREATING ..."

    note = Note.initial_create(params)

    if note.save
      render json: note
    else
      # TODO: Better error handling
      render json: {
        message: "Note creation invalid"
      }, code: 400
    end
  end
end
