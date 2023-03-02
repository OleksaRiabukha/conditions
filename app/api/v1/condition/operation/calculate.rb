module V1::Condition::Operation
  class Calculate < ::V1::BaseOperation
    # Operation is far to be complete and meant just to illustrate the approach
    # It's definetely missing errors handling, QO, more encapsulations etc.

    def call
      params = V1::Condition::Contract::Calculate.new.call(payload)
      return failure(params.errors.to_h) if params.failure?

      condition = find_condition(params[:id])
      object = initialize_base_object(condition.base_model_name, condition.formula['associations'])

      if condition.formula['associations'].present?
        transformed_associations = transform_associations(condition.formula['associations'])
        object = preload_associations(object, transformed_associations)
        object = map_associations(object, condition.formula['associations'].map(&:to_sym))
      end

      result = calculate(object, condition.formula)

      success(result)
    end

    private

    def find_condition(id)
      Condition.find_by(id: id)
    end

    def initialize_base_object(base_object_name, associations)
      object = base_object_name.capitalize.constantize

      return object.all if associations.blank?

      object
    end

    def preload_associations(object, associations)
      object.includes(associations)
    end

    def transform_associations(associations)
      return associations if associations.length == 1

      associations.reverse.inject { |value, key| { key => value } }
    end

    def map_associations(object, associations)
      associations.each do |association_name|
        object = object.flat_map { |obj| obj.send(association_name) }
      end

      object
    end

    def calculate(object, params)
      # Silly typecasting, should be handled properly, including dates
      value = params['value'].match?(/\A\d+\z/) ? params['value'].to_i : params['value']

      object.select do |obj|
        obj.send(params['field']).send(params['operand'], value)
      end
    end
  end
end
