json.users @users do |user|
  json.user_id user.id
  json.email user.email
  json.vacations user.vacations do |vacation|
    json.vacation_id vacation.id
    json.name vacation.name
    json.photos vacation.photos do |photo|
      json.id photo.id
      json.location photo.location
      json.longitude photo.longitude
      json.latitude photo.latitude
    end
  end
end
