require "administrate/base_dashboard"

class ViolationDashboard < Administrate::BaseDashboard
  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    created_at: Field::String,
    updated_at: Field::String,
    patch_position: Field::String,
    line_number: Field::String,
    messages: Field::String,
    pending: Field::String,
    file_review_id: Field::String,
    file_review: Field::BelongsTo,
  }

  TABLE_ATTRIBUTES = ATTRIBUTE_TYPES.keys.first(4)
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
end
