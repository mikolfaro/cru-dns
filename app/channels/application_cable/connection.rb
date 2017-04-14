module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_replica

    def connect
      self.current_replica = find_verified_replica
    end

    private

    def find_verified_replica
      # TODO  SECURE TOKEN!!! MAYBE USE DEVISE
      if (verified_replica = Replica.find_by_api_token(request_token))
        verified_replica
      else
        reject_unauthorized_connection
      end
    end

    def request_token
      # TODO  SECURE TOKEN!!! MAYBE USE DEVISE
      request.headers['Authorization'].split('Bearer ')[1]
    end
  end
end
