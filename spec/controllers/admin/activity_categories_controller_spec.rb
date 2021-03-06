require 'spec_helper'

describe Admin::ActivityCategoriesController do
  before(:all) do
    @user = Factory(:admin_user)
  end
  
  def valid_attributes
    {:name=>"new activity_#{Time.now.to_i}", :front_photo_id=>"123", :short_description=>"short_description"}
  end

  describe "GET index" do
    it "assigns all activity_categories as @activity_categories" do
      login_user(request, @user)
      activity_category = ActivityCategory.create! valid_attributes
      get :index
      assigns(:activity_categories).should_not be(nil)
    end
  end
  
  describe "GET new" do
    it "assigns a new activity_category as @activity_category" do
      login_user(request, @user)
      get :new
      assigns(:activity_category).should be_a_new(ActivityCategory)
    end
  end

  describe "GET edit" do
    it "assigns the requested activity_category as @activity_category" do
      login_user(request, @user)
      activity_category = ActivityCategory.create! valid_attributes
      get :edit, :id => activity_category.id.to_s
      assigns(:activity_category).should eq(activity_category)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ActivityCategory" do
        login_user(request, @user)
        expect {
          post :create, :activity_category => valid_attributes
        }.to change(ActivityCategory, :count).by(1)
      end

      it "assigns a newly created activity_category as @activity_category" do
        login_user(request, @user)
        post :create, :activity_category => valid_attributes
        assigns(:activity_category).should be_a(ActivityCategory)
        assigns(:activity_category).should be_persisted
      end

      it "redirects to the created activity_category" do
        login_user(request, @user)
        post :create, :activity_category => valid_attributes
        response.should redirect_to(admin_activity_categories_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved activity_category as @activity_category" do
        login_user(request, @user)
        # Trigger the behavior that occurs when invalid params are submitted
        ActivityCategory.any_instance.stub(:save).and_return(false)
        post :create, :activity_category => {}
        assigns(:activity_category).should be_a_new(ActivityCategory)
      end

      it "re-renders the 'new' template" do
        login_user(request, @user)
        # Trigger the behavior that occurs when invalid params are submitted
        ActivityCategory.any_instance.stub(:save).and_return(false)
        post :create, :activity_category => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested activity_category" do
        login_user(request, @user)
        activity_category = ActivityCategory.create! valid_attributes
        # Assuming there are no other activity_categories in the database, this
        # specifies that the ActivityCategory created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ActivityCategory.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => activity_category.id, :activity_category => {'these' => 'params'}
      end

      it "assigns the requested activity_category as @activity_category" do
        login_user(request, @user)
        activity_category = ActivityCategory.create! valid_attributes
        put :update, :id => activity_category.id, :activity_category => valid_attributes
        assigns(:activity_category).should eq(activity_category)
      end

      it "redirects to the activity_category" do
        login_user(request, @user)
        activity_category = ActivityCategory.create! valid_attributes
        put :update, :id => activity_category.id, :activity_category => valid_attributes
        response.should redirect_to(admin_activity_categories_path)
      end
    end

    describe "with invalid params" do
      it "assigns the activity_category as @activity_category" do
        login_user(request, @user)
        activity_category = ActivityCategory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ActivityCategory.any_instance.stub(:save).and_return(false)
        put :update, :id => activity_category.id.to_s, :activity_category => {}
        assigns(:activity_category).should eq(activity_category)
      end

      it "re-renders the 'edit' template" do
        login_user(request, @user)
        activity_category = ActivityCategory.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ActivityCategory.any_instance.stub(:save).and_return(false)
        put :update, :id => activity_category.id.to_s, :activity_category => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested activity_category" do
      login_user(request, @user)
      activity_category = ActivityCategory.create! valid_attributes
      expect {
        delete :destroy, :id => activity_category.id.to_s
      }.to change(ActivityCategory, :count).by(-1)
    end

    it "redirects to the activity_categories list" do
      login_user(request, @user)
      activity_category = ActivityCategory.create! valid_attributes
      delete :destroy, :id => activity_category.id.to_s
      response.should redirect_to(admin_activity_categories_path)
    end
  end

end