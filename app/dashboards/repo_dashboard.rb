require "administrate/base_dashboard"

class RepoDashboard < Administrate::BaseDashboard
  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
    :subscription,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    github_id: Field::String,
    active: Field::String,
    hook_id: Field::String,
    full_github_name: Field::String,
    created_at: Field::String,
    updated_at: Field::String,
    private: Field::String,
    in_organization: Field::String,
    owner_id: Field::String,
    builds: Field::HasMany,
    memberships: Field::HasMany,
    owner: Field::BelongsTo,
    subscription: Field::HasOne,
    users: Field::HasMany,
  }

  TABLE_ATTRIBUTES = ATTRIBUTE_TYPES.keys.first(4)
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
end
