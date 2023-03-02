module V1::Condition::Operation
  class Create < ::V1::BaseOperation
    def call
      params = V1::Condition::Contract::Create.new.call(payload)
      binding.pry
      result = { dummy: "ok" }

      success(result)
    end
  end
end
