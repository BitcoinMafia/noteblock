class Api::NotesController < ApplicationController
  def index
    limit = params[:limit] || 25
    offset = params[:offset] || 0
    notes = Note.confirmed.unflagged.order("notes.created_at DESC").limit(limit).offset(offset)
    notes = Note.cleanse(notes)

    render json: notes
  end

  def top
    limit = params[:limit] || 25
    offset = params[:offset] || 0

    # TODO: DUPS
    note_transactions = NoteTransaction.payments.order("satoshis DESC").limit(limit).offset(offset).includes(:note)
    notes = note_transactions.map do |ntx|
      ntx.note
    end
    notes = Note.cleanse(notes)

    render json: notes
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
      }, status: 400
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
      ap e.inspect
      ap e.backtrace
      PagerDutyMgr::CriticalBug.trigger("Post failed", {
        inspect: e.inspect,
        backtrace: e.backtrace
      })

      render json: {
        result: false
      }, status: 400
    end
  end

  def create
    begin
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
    rescue => e
      ap e.inspect
      ap e.backtrace
      PagerDutyMgr::CriticalBug.trigger("Create note failed", {
        inspect: e.inspect,
        backtrace: e.backtrace
      })

      render json: {
        result: false
      }, status: 400
    end
  end
end
