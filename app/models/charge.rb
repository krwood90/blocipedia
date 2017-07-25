class Charge <ActiveRecord:Base
  attr_accessor :card_number, card_cvc
  belongs_to :User

  def sel.month_options
    Date::MONTHNAMES.compact.each_with index.map {|name, i|}

  def self.year.year_options
    Date.today.yaer.. (Date today _+10 years)

    def process_charge

    customer= Stripe::Customer