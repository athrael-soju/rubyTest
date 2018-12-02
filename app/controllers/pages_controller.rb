
class PagesController < ApplicationController
  def about
  end

  def home
      @option_list = ''
      select_currencies ="select currency from forexes"
      currencies = ActiveRecord::Base.connection.execute(select_currencies)
      currencies.each do |row|
      @option_list+= '<option>'+row['currency']+'</option><br/>'
      end

      if params[:formControlSelect1]
        calculate_exchange
      end
  end

  def calculate_exchange
    @cur1 = params[:formControlSelect1]
    @cur2 = params[:formControlSelect2]
    @num = params[:number_input]
    @cool_value = 20*30
    @message = "#{@num} of #{@cur1} equals #{@cool_value} #{@cur2}"
  end

  def contact
  end
end
