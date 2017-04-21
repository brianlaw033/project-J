class Event < ActiveRecord::Base
  has_many(:category_events, dependent: :destroy)
  has_many(:categories, through: :category_events)

  has_many(:event_suppliers, dependent: :destroy)
  has_many(:suppliers, through: :event_suppliers)

  has_many(:event_users, dependent: :destroy)
  has_many(:users, through: :event_users)

  belongs_to(:user)

  def add_category(category_ids)
    arr = category_ids.map{|item| Integer(item)}
<<<<<<< HEAD

=======
>>>>>>> de3ef2da169ec96ab8b501aa53c7eb8dab21239e
    self.categories.each do |cat|
      arr.delete(cat.id)
    end

    arr.each do |cid|
      CategoryEvent.create({:category_id => Integer(cid), :event_id => self.id})
    end

  end
end
