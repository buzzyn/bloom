require 'rails_helper'

RSpec.describe Delivery, type: :model do
  describe 'class' do
    subject { Delivery }
    it { expect(subject.ancestors).to include(ActiveModel::Validations) }
  end

  describe 'new' do
    it { expect { Delivery.new }.to_not raise_error }
  end

  describe 'instance' do
    it { is_expected.to belong_to(:order) }
    it { is_expected.to belong_to(:bouquet) }
  end
end