class City < ActiveRecord::Base
  scope :is_collect, -> { where(is_collect: true) }
  has_many :photos
  def latlng
    [
      48.83286 + (48.887295 - 48.83286) * rand,
      2.296778 + (2.388445 - 2.296778) * rand
    ]
  end
end
