class ServiceResult
  attr_reader :value

  def initialize(status, value = nil)
    @status = status
    @value = value
  end

  def success?
    @status == :success
  end

  def failure?
    @status == :failure
  end
end
