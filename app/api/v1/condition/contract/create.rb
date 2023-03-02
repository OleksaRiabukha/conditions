module V1::Condition::Contract
  class Create < V1::BaseContract
    # Just to illustrate the logic of verifications
    # Contract should contain more rules
    ALLOWED_OPERANDS = ['>', '<', '==', '>=', '<=', '!='].freeze

    params do
      required(:condition).hash do
        required(:name).filled(:string)
        required(:base_model_name).filled(:string)
        required(:formula).hash do
          required(:field).filled(:string)
          required(:operand).value(included_in?: ALLOWED_OPERANDS)
          required(:value).filled(:string)
          optional(:associations).array(:str?)
          optional(:function_name).value(:string)
        end
      end
    end

    rule(condition: :base_model_name) do
      Rails.application.eager_load! if Rails.env.development?

      all_models = ApplicationRecord.descendants.collect(&:name)

      next if all_models.include?(value.capitalize)

      # Ideally, should be placed under I18n
      key.failure("There is no model with name #{value}")
    end
  end
end
