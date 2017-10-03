require 'rails_helper'

RSpec.describe Bouquet, :type => :model do
  describe 'class' do
    subject { Bouquet }
    it { expect(subject.ancestors).to include(ActiveModel::Validations) }
  end

  describe 'new' do
    it { expect { Bouquet.new }.to_not raise_error }
  end

  describe 'instance' do
    it { is_expected.to have_many(:orders) }
    it { is_expected.to have_many(:deliveries) }
  end
end