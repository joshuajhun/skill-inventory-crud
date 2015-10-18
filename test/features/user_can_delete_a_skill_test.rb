require_relative "../test_helper"

class DeleteSkillTest < FeatureTest
  def test_user_can_delete_a_skill
    SkillInventory.create({name: "pokemon", status: "ash"})
    visit "/skills"
    click_button("delete")
    refute page.has_content?("new skill")
  end
end
