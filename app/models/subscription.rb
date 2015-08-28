class Subscription < ActiveRecord::Base
  include Administratable

  acts_as_paranoid

  belongs_to :repo
  belongs_to :user
end
