class Record < ApplicationRecord
  belongs_to :user
  belongs_to :category
  default_scope -> { order(due_date: :asc) }
  validates :user_id, presence: true
  after_create :set_status
  after_create :set_frequency


  validates :title,
          :presence => {:message => "Title can't be blank." },
          # :uniqueness => {:message => "Title already exists."},
          :length => { :maximum => 100, :message => "Must be less than 100 characters"}

  validates :content,
          :presence => {:message => "Content can't be blank." },
          :length => { :maximum => 200, :message => "Must be less than 200 characters"}

  validates :due_date,
          :presence => {:message => "Date can't be blank." }

  FREQUENCY = {'0': 'Every week',
                '1': 'Every month',
                '2': 'Every 3 months',
                '3': 'Every 6 months',
                '4': 'Every year'
              }

  STATUSES = {'0': 'No Action Required',
              '1': 'Action!',
              '2': 'Done',
              '3': 'Deleted'
              }

  def set_status
    self.update_attributes(status: 0)
  end

  def set_frequency
    self.update_attributes(frequency: 0)
  end

  def status_title
    STATUSES[status.to_s.to_sym]
  end

  def frequency_title
    FREQUENCY[frequency.to_s.to_sym]
  end
end
