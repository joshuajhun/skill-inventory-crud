require_relative "../test_helper"

class Greetingtest < FeatureTest
  def test_user_can_see_the_greeting
    skip
    visit "/"

    assert_equal "/", current_path

    within('#greeting') do
      assert page.has_content?("Welcome to Skill Inventory")
    end
  end
end
