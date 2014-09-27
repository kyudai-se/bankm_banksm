require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe AreamsController do

  # This should return the minimal set of attributes required to create a valid
  # Aream. As you add validations to Aream, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { {  } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AreamsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all areams as @areams" do
      aream = Aream.create! valid_attributes
      get :index, {}, valid_session
      assigns(:areams).should eq([aream])
    end
  end

  describe "GET show" do
    it "assigns the requested aream as @aream" do
      aream = Aream.create! valid_attributes
      get :show, {:id => aream.to_param}, valid_session
      assigns(:aream).should eq(aream)
    end
  end

  describe "GET new" do
    it "assigns a new aream as @aream" do
      get :new, {}, valid_session
      assigns(:aream).should be_a_new(Aream)
    end
  end

  describe "GET edit" do
    it "assigns the requested aream as @aream" do
      aream = Aream.create! valid_attributes
      get :edit, {:id => aream.to_param}, valid_session
      assigns(:aream).should eq(aream)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Aream" do
        expect {
          post :create, {:aream => valid_attributes}, valid_session
        }.to change(Aream, :count).by(1)
      end

      it "assigns a newly created aream as @aream" do
        post :create, {:aream => valid_attributes}, valid_session
        assigns(:aream).should be_a(Aream)
        assigns(:aream).should be_persisted
      end

      it "redirects to the created aream" do
        post :create, {:aream => valid_attributes}, valid_session
        response.should redirect_to(Aream.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved aream as @aream" do
        # Trigger the behavior that occurs when invalid params are submitted
        Aream.any_instance.stub(:save).and_return(false)
        post :create, {:aream => {  }}, valid_session
        assigns(:aream).should be_a_new(Aream)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Aream.any_instance.stub(:save).and_return(false)
        post :create, {:aream => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested aream" do
        aream = Aream.create! valid_attributes
        # Assuming there are no other areams in the database, this
        # specifies that the Aream created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Aream.any_instance.should_receive(:update).with({ "these" => "params" })
        put :update, {:id => aream.to_param, :aream => { "these" => "params" }}, valid_session
      end

      it "assigns the requested aream as @aream" do
        aream = Aream.create! valid_attributes
        put :update, {:id => aream.to_param, :aream => valid_attributes}, valid_session
        assigns(:aream).should eq(aream)
      end

      it "redirects to the aream" do
        aream = Aream.create! valid_attributes
        put :update, {:id => aream.to_param, :aream => valid_attributes}, valid_session
        response.should redirect_to(aream)
      end
    end

    describe "with invalid params" do
      it "assigns the aream as @aream" do
        aream = Aream.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Aream.any_instance.stub(:save).and_return(false)
        put :update, {:id => aream.to_param, :aream => {  }}, valid_session
        assigns(:aream).should eq(aream)
      end

      it "re-renders the 'edit' template" do
        aream = Aream.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Aream.any_instance.stub(:save).and_return(false)
        put :update, {:id => aream.to_param, :aream => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested aream" do
      aream = Aream.create! valid_attributes
      expect {
        delete :destroy, {:id => aream.to_param}, valid_session
      }.to change(Aream, :count).by(-1)
    end

    it "redirects to the areams list" do
      aream = Aream.create! valid_attributes
      delete :destroy, {:id => aream.to_param}, valid_session
      response.should redirect_to(areams_url)
    end
  end

end
