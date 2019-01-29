require "administrate/base_dashboard"

class LodgingDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    reservation: Field::HasOne,
    application: Field::HasOne,
    id: Field::Number,
    plan: Field::String,
    description: Field::String,
    cost: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    reservation_id: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :reservation,
    :application,
    :id,
    :plan,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :reservation,
    :application,
    :id,
    :plan,
    :description,
    :cost,
    :created_at,
    :updated_at,
    :reservation_id,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :reservation,
    :application,
    :plan,
    :description,
    :cost,
    :reservation_id,
  ].freeze

  # Overwrite this method to customize how lodgings are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(lodging)
  #   "Lodging ##{lodging.id}"
  # end
end
