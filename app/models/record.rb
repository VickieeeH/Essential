class Record < ApplicationRecord
  belongs_to :user
  belongs_to :category
  default_scope -> { order(due_date: :asc) }
  validates :user_id, presence: true
  after_create :set_status

  validates :title,
          :presence => {:message => "Title can't be blank." },
          :uniqueness => {:message => "Title already exists."},
          :length => { :maximum => 100, :message => "Must be less than 100 characters"}

  validates :content,
          :presence => {:message => "Content can't be blank." },
          :length => { :maximum => 200, :message => "Must be less than 200 characters"}

  validates :due_date,
          :presence => {:message => "Date can't be blank." }

  STATUSES = { '0': 'Wait, no action required',
               '1': 'Done and Done!',
               '2': 'Item Refilled'
             }

  Frequency = {'0': 'Every week',
                '1': 'Every month',
                '2': 'Every 3 months',
                '3': 'Every 6 months',
                '4': 'Every year'
              }

  def set_status
    self.update_attributes(status: 0)
  end

  def update_status
    self.status + 1 unless self.status = 2
  end

  def status_title
    STATUSES[status.to_s.to_sym]
  end
end
