class Api::NotesController < ApplicationController
  def index
  end

  def show
    note = Note.retrieve(id: params[:id])
    render json: note
  end


  def claim
    ap params
    if !params[:encrypted_token] || !params[:to_address]
      render json: {
        result: false
      }
      return
    end

    begin
      claimed = Note.claim(
        encrypted_token: params[:encrypted_token],
        to_address: params[:to_address]
      )

      render json: {
        result: claimed
      }
    rescue => e
      PagerDutyMgr::CriticalBug.trigger("Post failed", {
        inspect: e.inspect,
        backtrace: e.backtrace
      })
    end
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
