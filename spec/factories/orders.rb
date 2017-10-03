def get_bouquet
  Bouquet.find_by(id: 1) || create(:bouquet,  name: 'John'.to_sym, price: '15.50')
end

FactoryGirl.define do
  factory :order do
    recipient_name 'Simon'
    bouquet { get_bouquet }
    delivery_on '2017-09-09'
    status 'billed'
    cost '12.20'
    three_month_bundle 'false'
    special_delivery 'Standard'
  end
end
