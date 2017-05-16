class InstallmentPaymentController < ApplicationController
  def create
    @installment_payment = InstallmentPayment.new(installment_payment_params)
    @amount = installment_payment_params[:amount].to_i
    respond_to do |format|
      if @amount > @installment_payment.installment_amount
        format.html { redirect_to :back, alert: 'El monto excede al saldo de la cuota cuota.' }
      else
        if @installment_payment.save
          format.html { redirect_to :back, notice: 'Se ha pagado la cuota correctamente.' }
        else
          format.html { render root_url }
        end
      end
    end
  end

  private
    def installment_payment_params
      params.require(:installment_payment).permit(:installment_id, :amount, :date, :budget_id)
    end
end
