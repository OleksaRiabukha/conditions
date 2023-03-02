module V1::Condition::Contract
  class Calculate < V1::BaseContract
    # Just to illustrate the logic of verifications
    params do
      required(:id).filled(:string)
    end
  end
end
