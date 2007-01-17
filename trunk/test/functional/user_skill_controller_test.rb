require File.dirname(__FILE__) + '/../test_helper'
require 'user_skill_controller'

# Re-raise errors caught by the controller.
class UserSkillController; def rescue_action(e) raise e end; end

class UserSkillControllerTest < Test::Unit::TestCase
  def setup
    @controller = UserSkillController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
