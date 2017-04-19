require 'rails_helper'

describe MessagesController do
  let(:user) {create(:user)}
  let(:group) {create(:group)}
  let(:members) {create_list(:user, 3)}
  let(:message) {create(:message, group_id: group.id, user_id:user.id)}

  describe "GET #index" do
    describe "when a user signs in" do

      before do
        sign_in user
        get :index, params: {group_id: group.id}
      end

      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq(group)
      end

      it "assigns the requested members to @members" do
        expect(assigns(:members)).to eq(group.users.map{|user| user[:name]}.join(' '))
      end
      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end

    describe "when a user doesn't sign in" do
      it "redirects to user_session_path" do
        get :index, params: {group_id: group.id}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe "POST #create" do
    describe "when a user signs in" do

      before do
        sign_in user
      end

      describe "when the body has content" do
        it "registers new message" do
          message = attributes_for(:message, user_id: user.id, group_id: group.id)
          expect{post :create, params:{message: message, group_id: group.id}}.to change(Message, :count).by(1)
        end

        it "renders the :index template" do
          message = attributes_for(:message, user_id: user.id, group_id: group.id)
          post :create, params:{message: message, group_id: group.id}
          expect(response).to redirect_to group_messages_path(group)
        end
      end

      describe "when the body is nil" do
        before do
          message = attributes_for(:message, body: nil, user_id: user.id, group_id: group.id)
          post :create, params:{message: message, group_id: group.id}
        end

        it "renders the :index template" do
          expect(response).to redirect_to group_messages_path(group)
        end

        it "makes an error message" do
          expect(flash[:notice]).not_to be_nil
        end
      end

    end
    describe "when a user doesn't sign in" do
      it "redirects to user_session_path" do
        message = attributes_for(:message, user_id: user.id, group_id: group.id)
        post :create, params:{message: message, group_id: group.id}
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end


