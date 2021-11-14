json.extract! book, :id, :name, :pub_date, :autor_id, :created_at, :updated_at
json.url book_url(book, format: :json)
