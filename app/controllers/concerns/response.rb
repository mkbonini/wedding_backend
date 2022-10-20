module Response
    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def lodging_response(object, status = :ok)
      render json: object, include: {:guests => { only: [:first_name, :last_name]}} , status: status
    end
end
  