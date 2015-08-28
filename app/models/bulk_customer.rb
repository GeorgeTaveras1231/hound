class BulkCustomer < ActiveRecord::Base
  include Administratable

  def self.unpaid_repos
    bulk_orgs = pluck(:org)
    Repo.
      includes(:subscription).
      where(subscriptions: { repo_id: nil }).
      where(private: true).
      where("full_github_name !~* ?", "(#{bulk_orgs.join('|')})").
      active
  end

  def update_current_repos
    repo_count = Repo.
      where("full_github_name ILIKE ?", "#{org}/%").
      where(private: true).
      active.
      count

    update(current_repos: repo_count)
  end
end
