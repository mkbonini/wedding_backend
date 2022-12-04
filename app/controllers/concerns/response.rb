module Response
    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def lodging_response(object, status = :ok)
      render json: object, include: {:guests => { only: [:first_name, :last_name, :kids]}, :kids => { only: [:name]}, :plus_ones => { only: [:name]}} , status: status
    end

    def guest_response(object, status = :ok)
      render json: object, include: {:kids => {only: [:id, :name, :age, :lodging_id, :team_id]} , :plus_ones => {only: [:id, :name, :lodging_id, :team_id]} } , status: status
    end
end
  