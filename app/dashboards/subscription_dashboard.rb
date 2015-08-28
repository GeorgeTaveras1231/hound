require "administrate/base_dashboard"

class SubscriptionDashboard < Administrate::BaseDashboard
  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    created_at: Field::String,
    updated_at: Field::String,
    user_id: Field::String,
    repo_id: Field::String,
    stripe_subscription_id: Field::String,
    deleted_at: Field::String,
    price: Field::String,
    repo: Field::BelongsTo,
    user: Field::BelongsTo,
  }

  TABLE_ATTRIBUTES = ATTRIBUTE_TYPES.keys.first(4)
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
end
