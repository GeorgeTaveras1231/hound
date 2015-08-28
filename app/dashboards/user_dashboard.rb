require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    created_at: Field::String,
    updated_at: Field::String,
    github_username: Field::String,
    remember_token: Field::String,
    refreshing_repos: Field::String,
    email_address: Field::String,
    stripe_customer_id: Field::String,
    token: Field::String,
    memberships: Field::HasMany,
    repos: Field::HasMany,
    subscribed_repos: Field::HasMany.with_options(class_name: "Repo"),
    subscriptions: Field::HasMany,
  }

  TABLE_ATTRIBUTES = ATTRIBUTE_TYPES.keys.first(4)
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
end
