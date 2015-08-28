require "administrate/base_dashboard"

class FileReviewDashboard < Administrate::BaseDashboard
  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    build_id: Field::String,
    completed_at: Field::String,
    created_at: Field::String,
    updated_at: Field::String,
    filename: Field::String,
    build: Field::BelongsTo,
    violations: Field::HasMany,
  }

  TABLE_ATTRIBUTES = ATTRIBUTE_TYPES.keys.first(4)
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
end
