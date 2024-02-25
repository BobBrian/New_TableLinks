json.extract! reservation, :id, :reservation_time, :inactive, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
