require "administrate/base_dashboard"

class ApplicationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    enrollments: Field::HasMany,
    workshops: Field::HasMany,
    reservation: Field::HasOne,
    lodging: Field::HasOne,
    id: Field::Number,
    first_name: Field::String,
    last_name: Field::String,
    gender: Field::String,
    birth_year: Field::Number,
    street: Field::String,
    street2: Field::String,
    city: Field::String,
    state: Field::String,
    zip: Field::String,
    country: Field::String,
    phone: Field::String,
    email: Field::String,
    email_confirmation: Field::String,
    workshop_selection1: Field::String,
    workshop_selection2: Field::String,
    workshop_selection3: Field::String,
    lodging_selection: Field::String,
    partner_registration_selection: Field::String,
    partner_first_name: Field::String,
    partner_last_name: Field::String,
    how_did_you_hear: Field::String,
    accessibility_requirements: Field::Text,
    special_lodging_request: Field::Text,
    food_restrictions: Field::Text,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :enrollments,
    :workshops,
    :reservation,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :enrollments,
    :workshops,
    :reservation,
    :lodging,
    :id,
    :first_name,
    :last_name,
    :gender,
    :birth_year,
    :street,
    :street2,
    :city,
    :state,
    :zip,
    :country,
    :phone,
    :email,
    :email_confirmation,
    :workshop_selection1,
    :workshop_selection2,
    :workshop_selection3,
    :lodging_selection,
    :partner_registration_selection,
    :partner_first_name,
    :partner_last_name,
    :how_did_you_hear,
    :accessibility_requirements,
    :special_lodging_request,
    :food_restrictions,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :enrollments,
    :workshops,
    :reservation,
    :lodging,
    :first_name,
    :last_name,
    :gender,
    :birth_year,
    :street,
    :street2,
    :city,
    :state,
    :zip,
    :country,
    :phone,
    :email,
    :email_confirmation,
    :workshop_selection1,
    :workshop_selection2,
    :workshop_selection3,
    :lodging_selection,
    :partner_registration_selection,
    :partner_first_name,
    :partner_last_name,
    :how_did_you_hear,
    :accessibility_requirements,
    :special_lodging_request,
    :food_restrictions,
  ].freeze

  # Overwrite this method to customize how applications are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(application)
  #   "Application ##{application.id}"
  # end
end
