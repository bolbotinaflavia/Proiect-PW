json.extract! eveniment, :id, :titlu, :descriere, :start_time, :end_time, :created_at, :updated_at
json.url eveniment_url(eveniment, format: :json)
