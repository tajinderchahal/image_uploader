class Images < ApplicationRecord
  belongs_to :album
  uploaded_on :datetime
end
