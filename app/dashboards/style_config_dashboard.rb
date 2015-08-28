require "administrate/base_dashboard"

class StyleConfigDashboard < Administrate::BaseDashboard
  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    enabled: Field::String,
    language: Field::String,
    rules: Field::String,
    owner_id: Field::String,
    owner: Field::BelongsTo,
  }

  TABLE_ATTRIBUTES = ATTRIBUTE_TYPES.keys.first(4)
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
end
