include ActionView::Helpers::NumberHelper

class PagesController < ApplicationController
  def home
      init_on_load
      check_if_submit
  end

  def init_on_load
    generate_currency_collection
    calculate_dates
  end

  def check_if_submit
    if params[:commit] == "Submit"
      calculate_exchange
    end
  end

  def calculate_dates
    select_date ="select updated_at from forexes where currency = 'USD'"
    get_date = ActiveRecord::Base.connection.execute(select_date)[0]['updated_at']
    @last_updated = "Last update:   #{get_date}"

    difference_in_dates = (DateTime.now - Date.parse(get_date)).to_i
    if difference_in_dates > 0
      @last_updated+= " - Days outdated: #{difference_in_dates}."
    end
  end

  def generate_currency_collection
    @option_list1 = ''
    @option_list2 = ''
    select_currencies ="select currency from forexes"
    currencies = ActiveRecord::Base.connection.execute(select_currencies)
    cur1 = params[:formControlSelect1]
    cur2 = params[:formControlSelect2]
    currencies.each do |row|
      @option_list1+= "<option #{adjust_dropdowns_if_selected(cur1, row)}>"+row['currency']+'</option><br/>'
      @option_list2+= "<option #{adjust_dropdowns_if_selected(cur2, row)}>"+row['currency']+'</option><br/>'
    end
  end

  def adjust_dropdowns_if_selected(param, row)
    if param == row['currency']
      "selected"
    end
  end

  def calculate_exchange
    cur1 = params[:formControlSelect1]
    cur2 = params[:formControlSelect2]
    quantity = params[:quantity].to_f
    select_rate1 ="select rate from forexes where currency = '#{cur1}'"
    select_rate2 ="select rate from forexes where currency = '#{cur2}'"

    rate1 = ActiveRecord::Base.connection.execute(select_rate1)[0]['rate']
    rate2 = ActiveRecord::Base.connection.execute(select_rate2)[0]['rate']
    formatted_conversion = number_to_human(((1/rate1)*rate2*quantity))
    formatted_quantity = number_to_human(quantity)
    @conversion_result = "#{formatted_quantity} #{cur1} is equivalent to: #{formatted_conversion} #{cur2}"
  end

end
