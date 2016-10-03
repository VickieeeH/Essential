class Category < ApplicationRecord
  has_many :records, :dependent => :destroy
  belongs_to :user

  validates :title,
          :presence => {:message => "Title can't be blank." },
          :uniqueness => {:message => "Title already exists."},
          :length => { :maximum => 100, :message => "Must be less than 100 characters"}
end
