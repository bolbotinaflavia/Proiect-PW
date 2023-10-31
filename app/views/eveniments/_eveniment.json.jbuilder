json.extract! eveniment, :id, :titlu, :descriere, :timp_start, :timp_final, :created_at, :updated_at
json.url eveniment_url(eveniment, format: :json)
