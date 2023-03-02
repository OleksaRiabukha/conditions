module V1::Condition::Operation
  class Create < ::V1::BaseOperation
    # Operation is far to be complete and meant just to illustrate the approach
    # It's definetely missing errors handling, QO, more encapsulations etc.

    def call
      params = V1::Condition::Contract::Create.new.call(payload)
      return failure(params.errors.to_h) if params.failure?

      result = create_condition(params.to_h[:condition])

      success(result)
    end

    private

    def create_condition(params)
      Condition.create(params)
    end
  end
end
