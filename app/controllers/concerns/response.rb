module Response
    def json_response(object, status = :ok)
      render json: object, status: status
    end

    def lodging_response(object, status = :ok)
      render json: object, methods: [:occupants, :spots_remaining ], status: status
    end

    def guest_response(object, status = :ok)
      render json: object, 
      except: [:party_count, :bed_count, :created_at, :updated_at, :payment_method], 
      include: {:kids => {only: [:id, :name, :age, :needs_bed, :child_care, :lodging_id, :team_id, :has_kids]} , :plus_ones => {only: [:id, :name, :lodging_id, :team_id]} }, 
      methods: [:full_name, :party_count, :bed_count, :party ], 
      status: status
    end
end
  