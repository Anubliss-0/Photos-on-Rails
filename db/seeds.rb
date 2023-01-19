6.times do
  photo = Photo.create(
    title: Faker::Tea.variety,
    description: Faker::Movies::Ghostbusters.quote,
    camera: Faker::Camera.brand_with_model,
    film: Faker::Device.platform,
    date: Faker::Date.between(from: '2014-09-23', to: '2014-09-25'),
    user_id: 1
  )
  file = URI.open("https://picsum.photos/950/550")
  photo.photo.attach(io: file, filename:"filler.jpeg", content_type:"image/jpeg")
  photo.save!
end

6.times do
  album = Collection.create(
    name:Faker::Artist.name,
    description: Faker::Quote.famous_last_words,
    user_id: 1,
    cover: 1
  )
  album.save!
  Photo.all.each do |photo|
    bookmark = Bookmark.create(
      photo_id: photo.id,
      collection_id: album.id
    )
    bookmark.save!
  end
end
