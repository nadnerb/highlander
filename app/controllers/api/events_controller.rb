module Api

  class EventsController < BaseController
    respond_to :json

    before_filter :validate_payload!

    def create
      code = :not_found
      if Event.create(payload.to_event_hash)
        $statsd.increment("create:#{params[:metric]}")
        code = :ok
      end

      respond_to do |format|
        format.json { head code }
      end
    end

    private

    def validate_payload!
      payload.validate!
    end

    def payload
      @payload ||= Factories::PayloadAdapterFactory.for(params)
    end

  end

end
