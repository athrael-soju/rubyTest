include ActionView::Helpers::NumberHelper

class PagesController < ApplicationController
  def home
      init_on_load
      if params[:formControlSelect1]
        calculate_exchange
      end
  end

  def init_on_load
    generate_currency_collection
    calculate_dates
  end

  def calculate_dates
    select_date ="select updated_at from forexes where currency = 'USD'"
    get_date = ActiveRecord::Base.connection.execute(select_date)[0]['updated_at']
    @date_now = "Current:             " + DateTime.now.strftime('%a, %d %b %Y %H:%M:%S')
    @last_updated = "Rates updated:   #{get_date}"

    difference_in_dates = (DateTime.now - Date.parse(get_date)).to_i
    if difference_in_dates > 0
      @last_updated+= "(#{difference_in_dates} days behind. Consider updating rates.)"
    end
  end

  def generate_currency_collection
    @option_list = ''
    select_currencies ="select currency from forexes"
    currencies = ActiveRecord::Base.connection.execute(select_currencies)

    currencies.each do |row|
      @option_list+= '<option>'+row['currency']+'</option><br/>'
    end
  end

  def calculate_exchange
    cur1 = params[:formControlSelect1]
    cur2 = params[:formControlSelect2]
    quantity = params[:number_input].to_f
    select_rate1 ="select rate from forexes where currency = '#{cur1}'"
    select_rate2 ="select rate from forexes where currency = '#{cur2}'"

    rate1 = ActiveRecord::Base.connection.execute(select_rate1)[0]['rate']
    rate2 = ActiveRecord::Base.connection.execute(select_rate2)[0]['rate']
    formatted_conversion = number_to_human(((1/rate1)*rate2*quantity))
    formatted_quantity = number_to_human(params[:number_input].to_f)
    @conversion_result = "#{formatted_quantity} #{cur1} is equivalent to: #{formatted_conversion} #{cur2}"
  end
end
