json.vacations @user.vacations do |vacation|
  json.id vacation.id
  json.name vacation.name
  json.photos vacation.photos do |photo|
    json.id photo.id
    json.location photo.location
    json.latitude photo.latitude
    json.longitude photo.longitude
  end
end
