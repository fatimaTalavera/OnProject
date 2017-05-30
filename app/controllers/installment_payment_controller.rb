class InstallmentPaymentController < ApplicationController
  def create
    @payment = InstallmentPayment.new(installment_payment_params)
    @amount = installment_payment_params[:amount].to_i
    if @amount > @payment.installment_amount
      redirect_to :back, alert: 'El monto excede al saldo de la cuota.'
    else
      if @payment.save
        redirect_to :back, notice: 'Se ha pagado la cuota correctamente.'
      else
        render root_url
      end
    end
  end

  private
    def installment_payment_params
      params.require(:installment_payment).permit(:installment_id, :amount, :date, :budget_id)
    end
end
