class ApplicationController < ActionController::API
  def run_and_render(operation)
    result = operation.call(payload: unsafe_params )

    render json: result.value
  end

  def unsafe_params
    params.to_unsafe_h
  end
end
