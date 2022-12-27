module Response
    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def lodging_response(object, status = :ok)
      render json: object, methods: [:occupants, :spots_remaining ], status: status
    end

    def guest_response(object, status = :ok)
      render json: object, include: {:kids => {only: [:id, :name, :age, :needs_bed, :lodging_id, :team_id]} , :plus_ones => {only: [:id, :name, :lodging_id, :team_id]} } , status: status
    end
end
  