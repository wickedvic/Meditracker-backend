Doctor.destroy_all
User.destroy_all
Med.destroy_all

require 'faker'
require 'net/http'
require 'open-uri'
require 'json'


doc1 = Doctor.create!(name: Faker::Name.unique.name, email: "doc1@gmail.com", password_digest: BCrypt::Password.create('pass123'))
doc2 = Doctor.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password_digest: BCrypt::Password.create('pass123'))
doc3 = Doctor.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, password_digest: BCrypt::Password.create('pass123'))

User.create!(name: Faker::Name.unique.name, email: "pat1@gmail.com", image: Faker::Avatar.image, password_digest: BCrypt::Password.create('pass123'), doctor_id: [doc1.id, doc2.id, doc3.id].sample)

    30.times do 
        User.create!(name: Faker::Name.unique.name, email: Faker::Internet.unique.email, image: Faker::Avatar.image, password_digest: BCrypt::Password.create('pass123'), doctor_id: [doc1.id, doc2.id, doc3.id].sample)
    end


def seed_meds
    colors = ["black", "blue", "brown", "gray", "green", "orange", "pink", "purple", "red", "turquoise", "white", "yellow"]

    100.times do 
        endpoint = "https://rximage.nlm.nih.gov/api/rximage/1/rxnav?color=#{colors.sample}&includeMpc=true"
        data = Net::HTTP.get(URI(endpoint))
        data = JSON.parse(data)
        if  data
            data= data["nlmRxImages"]
            index = rand(1..25)
            med  =  data [ index ]
            if med && med["name"] && med['mpc']['color'] && med['imageUrl']
                Med.create!(name: med["name"], pill_color: med['mpc']['color'], image_url: med['imageUrl'])
            end
        end
    end
end



