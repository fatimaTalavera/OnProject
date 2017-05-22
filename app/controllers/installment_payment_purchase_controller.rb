class InstallmentPaymentPurchaseController < ApplicationController
  def create
    @payment = InstallmentPaymentPurchase.new(payment_params)
    @amount = payment_params[:amount].to_i
    if @amount > @payment.installment_purchase_amount
      redirect_to :back, alert: 'El monto excede al saldo de la cuota cuota.'
    else
      if @payment.save
        redirect_to :back, notice: 'Se ha pagado la cuota correctamente.'
      else
        render root_url
      end
    end
  end

  private
    def payment_params
      params.require(:installment_payment_purchase).permit(:installment_purchase_id, :amount, :date)
    end
end
