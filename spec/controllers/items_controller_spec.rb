require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #index' do
    it "indexのviewが表示される" do
      get :index
      expect(response).to render_template :index
    end
    # it "@itemsにデータを取得できているか" do
    #   item = create(:item)
    #   get :index
    #   expect(assigns(:item)).to eq item
    # end
  end

end