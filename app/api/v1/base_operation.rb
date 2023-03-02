module V1
  class BaseOperation < ApplicationService
    attr_reader :payload

    def initialize(payload:)
      @payload = payload
    end
  end
end
