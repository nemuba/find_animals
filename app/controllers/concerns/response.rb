# frozen_string_literal: true

module Response
  def json_response(data = [], status = :ok, **options)
    render json: data, status: status, **options
  end

  def json_response_error(data = [], status = :unprocessable_entity, **options)
    render json: data.errors.full_messages, status: status, **options
  end
end
