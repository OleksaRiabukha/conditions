module V1::Condition::Contract
  class Create < V1::BaseContract
    params do
      required(:condition).hash do
        required(:name).filled(:string)
        required(:model_name).filled(:string)
        required(:associations).array(:str?)
        required(:function).hash do
          required(:name).filled(:string)
          required(:operand).value(included_in?: ['>', '<'])
          required(:value).filled(:string)
        end
      end
    end
  end
end
