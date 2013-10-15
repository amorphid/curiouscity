require 'spec_helper'

describe QuestionsController do
  let(:valid_attributes) {
                           { :display_text => "display text",
                             :name => "name",
                             :email => "email@email.com",
                             :email_confirmation => "email@email.com"
                            }
                          }

  describe "GET index" do
    it "assigns all questions as @questions" do
      question = Question.create! valid_attributes
      get :index, {}
      assigns(:questions).should eq([question])
    end
  end

  describe "GET show" do
    it "assigns the requested question as @question" do
      question = Question.create! valid_attributes
      get :show, {:id => question.to_param}
      assigns(:question).should eq(question)
    end
  end

  describe "GET new" do
    it "assigns a new question as @question" do
      get :new, {}
      assigns(:question).should be_a_new(Question)
    end

    it "assigns categories" do
      category = FactoryGirl.create(:category)
      get :new, {}
      assigns(:categories).should == [category]
    end

    it "assigns passed params into the question" do
      get :new, {:display_text => 'display', :name => 'name', :anonymous => 'true', :email => 'lkj@lkj.com'}
      question = assigns(:question)
      expect(question.display_text).to eq 'display'
      expect(question.name).to eq 'name'
      expect(question.anonymous).to eq true
      expect(question.email).to eq 'lkj@lkj.com'
    end
  end

  describe "POST create" do
    it "creates a new Question" do
      expect {
        post :create, {:question => valid_attributes}
      }.to change(Question, :count).by(1)
    end

    it "assigns a newly created question as @question" do
      post :create, {:question => valid_attributes}
      assigns(:question).should be_a(Question)
      assigns(:question).should be_persisted
    end

    it "redirects to the created question" do
      post :create, {:question => valid_attributes}
      response.should redirect_to(question_url(Question.last))
    end
  end

  describe "POST confirm" do
    describe "with valid params" do
      it "assigns the new question as @question" do
        post :confirm, {:question => valid_attributes}
        assigns(:question).should be_a_new(Question)
      end
    end
    describe "with invalid params" do
      it "assigns a newly created but unsaved question as @question" do
        # Trigger the behavior that occurs when invalid params are submitted
        Question.any_instance.stub(:save).and_return(false)
        post :confirm, {:question => { "original_text" => "invalid value" }}
        assigns(:question).should be_a_new(Question)
      end
      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Question.any_instance.stub(:save).and_return(false)
        post :confirm, {:question => { "original_text" => "invalid value" }}
        response.should render_template("new")
      end
    end
  end
end