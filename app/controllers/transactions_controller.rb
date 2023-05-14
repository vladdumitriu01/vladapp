class TransactionsController < ApplicationController
  def make_payment
    logged_in_user = current_user
    user_to_transfer = User.find_by_email(params[:account_email])
    amount = params[:amount]
    description = params[:description]
    transaction = Transaction.create_new_transaction(logged_in_user, user_to_transfer.id, amount, description)
    transaction.initiate
    redirect_to root_path, info: 'Transaction made with success!'
  rescue
    flash.now[:danger] = 'Transaction Error'
    render 'users/payment_info'
  end
end
