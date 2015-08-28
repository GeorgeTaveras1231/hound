require "administrate/base_dashboard"

class OwnerDashboard < Administrate::BaseDashboard
  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    created_at: Field::String,
    updated_at: Field::String,
    github_id: Field::String,
    name: Field::String,
    organization: Field::String,
    repos: Field::HasMany,
    style_configs: Field::HasMany,
  }

  TABLE_ATTRIBUTES = ATTRIBUTE_TYPES.keys.first(4)
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
end
