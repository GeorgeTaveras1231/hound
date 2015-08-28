class Owner < ActiveRecord::Base
  include Administratable

  has_many :repos
  has_many :style_configs, dependent: :destroy

  def self.upsert(github_id:, name:, organization:)
    owner = find_or_initialize_by(github_id: github_id)
    owner.name = name
    owner.organization = organization
    owner.save!
    owner
  end
end
