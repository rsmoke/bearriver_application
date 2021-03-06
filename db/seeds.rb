# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# On production use: bin/rails db:seed RAILS_ENV=production

Workshop.create!([
  {
    instructor: 'Jerry Dennis',
    first_name: 'Jerry',
    last_name: 'Dennis'
  },
  {
    instructor: 'A. Van Jordan',
    first_name: 'A.',
    last_name: 'Jordan'
  },
  {
    instructor: 'Thomas Lynch',
    first_name: 'Thomas',
    last_name: 'Lynch'
  },
  {
    instructor: 'Richard Tillinghast',
    first_name: 'Richard',
    last_name: 'Tillinghast'
  },
  {
    instructor: 'Catherine Wing',
    first_name: 'Catherine',
    last_name: 'Wing'
  },
  {
    instructor: 'Desiree Cooper',
    first_name: 'Desiree',
    last_name: 'Cooper'
  },
  {
    instructor: 'V.V. (Sugi) Ganeshananthan',
    first_name: 'V.V.',
    last_name: 'Ganeshananthan'
  },
  {
    instructor: 'Mardi Link',
    first_name: 'Mardi',
    last_name: 'Link'
  },
  {
    instructor: 'Diane Seuss',
    first_name: 'Diane',
    last_name: 'Seuss'
  },
  {
    instructor: 'Douglas Trevor',
    first_name: 'Douglas',
    last_name: 'Trevor'
  }
])
Lodging.create!([
  {
    plan: 'A',
    description: 'Private Room and Private Bath',
    cost: '905.0'
  },
  {
    plan: 'A',
    description: 'Semi-Private Room and Shared Bath',
    cost: '850.0'
  },
  {
    plan: 'A',
    description: 'Bunk Room',
    cost: '740.0'
  },
  {
    plan: 'B',
    description: 'No Lodging',
    cost: '645.0'
  }
])

PartnerRegistration.create!([
  {
    description: 'My spouse/partner will not be attending the workshops, but will attend the conference AND readings',
    cost: '570.0'
  },
  {
    description: 'My spouse/partner will not be attending the workshops, but will attend the conference',
    cost: '440.0'
  },
  {
    description: 'I am attending the conference alone.',
    cost: '0.0'
  },
  {
    description: 'My spouse/partner will be registering separately for the conference and workshops.',
    cost: '0.0'
  }
])

ApplicationSetting.create!([
  {
    opendate: Time.now,
    application_buffer: 50,
    contest_year: Time.now.year,
    time_zone: "EST",
    active_application: true
  }
])

Gender.create!([
  {
    name: Male,
    description: dude type
  },
  {
    name: Female,
    description: dudette type
  }
])
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?