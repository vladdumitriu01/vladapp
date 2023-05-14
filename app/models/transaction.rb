class Transaction < ApplicationRecord
  belongs_to :user


  def self.create_new_transaction(logged_in_user, user_to_transfer, amount, description)
    transaction = Transaction.new(user: logged_in_user,
                                  destination: user_to_transfer,
                                  amount: amount,
                                  description: description,
                                  status_of_payment: 'new')
    transaction.save
    transaction
  end

  def initiate
    self.status_of_payment = 'pending'
    raise StandardError unless self.amount > 0 && self.amount < starting_point
    raise StandardError if user.id == self.destination.to_i
    user_target = User.find(self.destination)
    user.update_attribute(:bambeuro, user.bambeuro - amount)
    user_target.update_attribute(:bambeuro, user_target.bambeuro + amount)

    self.status_of_payment = 'success'
    self.save
  rescue
    self.status = 'failed'
  end

  def starting_point
    self.user.bambeuro
  end
end
