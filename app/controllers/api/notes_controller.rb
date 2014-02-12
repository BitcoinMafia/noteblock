class Api::NotesController < ApplicationController
  def index
  end

  def show
    note = Note.retrieve(id: params[:id])
    render json: note
  end

  def claim
    note = Note.claim(id: params[:id], encrypted_token: params[:encrypted_token])

    render json: note

  end

  def create
    ap "CREATING NOTE ..."
    note = Note.initial_build(params)

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
