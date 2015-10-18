require_relative "../test_helper"

class ViewSkillTest < FeatureTest
  def test_user_can_view_all_skill
    skip
    visit "/"

    click_link("View Skills Inventory")
    assert_equal "/skills", current_path
  end
end
