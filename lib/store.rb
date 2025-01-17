class Store < ActiveRecord::Base
  has_many :employees

  validates :name, length: { minimum: 3 }
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :carries_apparel

  def carries_apparel
    if !mens_apparel && !womens_apparel
      errors.add(:base, "Either mens or womens apparel must be carried at this store")
    end
  end

end
