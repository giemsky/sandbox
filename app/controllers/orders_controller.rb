class OrdersController < ApplicationController
  def index
    @orders = Orders::Order.all
  end

  def new
    @languages = Orders::Language.all
  end

  def create
    cmd = Ordering::SubmitOrder.new(
                                   order_uid: SecureRandom.uuid,
                                   source_language_id: params[:source_language_id],
                                   target_language_id: params[:target_language_id],
                                   source_text: params[:source_text],
                                   comments: params[:comments]
    )
    command_bus.(cmd)
    redirect_to orders_path#order_path(Orders::Order.find_by_uid(cmd.order_uid)), notice: 'Order was successfully submitted.'
  end

  def show
    @order = Orders::Order.find(params[:id])
  end
end