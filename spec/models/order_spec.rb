require 'rails_helper'
require 'spec_helper'
require 'mocha/setup'
require 'pry'

RSpec.describe Order do
  describe 'class' do
    subject { Order }
    it { expect(subject.ancestors).to include(ActiveModel::Validations) }
  end

  describe 'new' do
    it { expect { Order.new }.to_not raise_error }
  end

  describe 'instance' do
    it { is_expected.to belong_to(:bouquet) }
    it { is_expected.to have_many(:deliveries) }
  end

  describe "public instance methods" do
    let(:order) { FactoryGirl.create(:order) }

    context "responds to determined_billed methods" do
      it { expect(order).to respond_to(:determined_billed) }
    end

    context "executes determined_billed correctly" do
      it "return status failed" do
        allow(order).to receive(:chance).and_return(1)
        expect(order.determined_billed).to eq(failed_status)
      end
    end

    context "executes determined_billed correctly" do
      it "return status failed" do
        allow(order).to receive(:chance).and_return(2)
        expect(order.determined_billed).to eq(billed_status)
      end
    end
  end

  def billed_status
    'billed'
  end

  def failed_status
    'failed'
  end
end
