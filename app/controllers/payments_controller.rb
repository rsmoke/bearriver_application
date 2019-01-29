  require 'digest'
  require 'time'

  class PaymentsController < ApplicationController
    before_action :authenticate_user!
    before_action :current_user,   only: %i[payment_receipt make_payment]

    def payment_receipt
      # params.each do |key,value|
      #   Rails.logger.warn "Param #{key}: #{value}"
      # end
      Payment.create(
        transaction_type: params['transactionType'],
        transaction_status: params['transactionStatus'],
        transaction_id: params['transactionId'],
        total_amount: params['transactionTotalAmount'],
        transaction_date: params['transactionDate'],
        account_type: params['transactionAcountType'],
        result_code: params['transactionResultCode'],
        result_message: params['transactionResultMessage'],
        user_account: params['orderNumber'],
        payer_identity: @current_user.email,
        timestamp: params['timestamp'],
        transaction_hash: params['hash'],
        user_id: current_user.id
      )

      @current_payment = Payment.find_by(transaction_id: params[:transactionId])

    end

    def make_payment
      processed_url = generate_hash(@current_user)
      redirect_to processed_url
    end

    private
      def generate_hash(current_user)
        user_account = current_user.email.partition('@').first + '-' + current_user.id.to_s
        redirect_url = 'https://lsa-english-bearriver.miserver.it.umich.edu/payment_receipt'
        amount_to_be_payed = 100
        if Rails.env.development? || current_user.id == 1
           key_to_use = 'test_key'
           url_to_use = 'test_URL'
         else
           key_to_use = 'prod_key'
           url_to_use = 'prod_URL'
         end

        connection_hash = {
         'test_key' => Rails.application.credentials.NELNET_SERVICE[:DEVELOPMENT_KEY],
         'test_URL' => Rails.application.credentials.NELNET_SERVICE[:DEVELOPMENT_URL],
         'prod_key' => Rails.application.credentials.NELNET_SERVICE[:PRODUCTION_KEY],
         'prod_URL' => Rails.application.credentials.NELNET_SERVICE[:PRODUCTION_URL]
        }
        current_epoch_time = DateTime.now.strftime("%Q").to_i
        initial_hash = {
          'orderNumber' => user_account,
          'orderType' => 'English Department Online',
          'orderDescription' => 'Bearriver Conference Fees',
          'amountDue' => amount_to_be_payed * 100,
          'redirectUrl' => redirect_url,
          'redirectUrlParameters' => 'transactionType,transactionStatus,transactionId,transactionTotalAmount,transactionDate,transactionAcountType,transactionResultCode,transactionResultMessage,orderNumber',
          'retriesAllowed' => 1,
          'timestamp' => current_epoch_time,
          'key' => connection_hash[key_to_use]
        }

        # Sample Hash Creation
        hash_to_be_encoded = initial_hash.values.map{|v| "#{v}"}.join('')
        encoded_hash =  Digest::SHA256.hexdigest hash_to_be_encoded

        # Final URL
        url_for_payment = initial_hash.map{|k,v| "#{k}=#{v}&" unless k == 'key'}.join('')
        final_url = connection_hash[url_to_use] + url_for_payment + 'hash=' + encoded_hash
      end

      def url_params
        params.permit(:transactionType, :transactionStatus, :transactionId, :transactionTotalAmount, :transactionDate, :transactionAcountType, :transactionResultCode, :transactionResultMessage, :orderNumber, :timestamp, :hash)
      end
  end
