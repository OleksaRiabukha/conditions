module V1::Condition::Contract
  class Create < V1::BaseContract
    params do
      required(:condition).hash do
        required(:name).filled(:string)
        required(:model_name).filled(:string)
        required(:formula).hash do
          required(:name).filled(:string)
          required(:field).filled(:string)
          required(:operand).value(included_in?: ['>', '<'])
          required(:value).filled(:string)
          optional(:associations).array(:str?)
          optional(:function_name).value(:string)
        end
      end
    end
  end
end
