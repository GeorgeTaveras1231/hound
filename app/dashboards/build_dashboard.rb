require "administrate/base_dashboard"

class BuildDashboard < Administrate::BaseDashboard
  READ_ONLY_ATTRIBUTES = [
    :id,
    :created_at,
    :updated_at,
  ]

  ATTRIBUTE_TYPES = {
    id: Field::String,
    violations_archive: Field::String,
    repo_id: Field::String,
    created_at: Field::String,
    updated_at: Field::String,
    uuid: Field::String,
    pull_request_number: Field::String,
    commit_sha: Field::String,
    repo: Field::BelongsTo,
    user: Field::BelongsTo,
    file_reviews: Field::HasMany,
    violations: Field::HasMany,
  }

  TABLE_ATTRIBUTES = ATTRIBUTE_TYPES.keys.first(4)
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys
  FORM_ATTRIBUTES = ATTRIBUTE_TYPES.keys - READ_ONLY_ATTRIBUTES
end
