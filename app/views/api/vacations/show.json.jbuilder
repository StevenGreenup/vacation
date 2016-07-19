json.vacation do
  json.vacation_id @vacation.id
  json.name @vacation.name
    json.photos @vacation.photos do |photo|
      json.id photo.id
      json.location photo.location
      json.longitude photo.longitude
      json.latitude photo.latitude
    end
end
