require_relative "../test_helper"

class NewSkilltest < FeatureTest
  def test_user_can_create_a_new_skill
    visit("/")
    click_link("Add a New Skill")

    fill_in "skill-name", with: "New Skill name"
    fill_in "skill-status", with: "New status"

    click_button('Create Skill')
    
    assert_equal "/skills", current_path
    # within(".container") do
    #   assert page.has_content?("new task")
    # end
  end
end
