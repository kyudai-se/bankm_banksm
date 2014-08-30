require 'spec_helper'

describe BankmsController do
  render_views
  before(:each) do
    @bankm = create :bankm
  end

  describe '#index' do
    let(:request) { get :index }
    it 'ステータスコード200を返す' do
      request
      response.status.should == 200
      response.should render_template('index')
    end

    it '登録されたbankを返す' do
      request
      assigns(:bankm).should eq(@bankm)
    end
  end
end
