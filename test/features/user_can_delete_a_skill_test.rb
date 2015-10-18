require_relative "../test_helper"

class DeleteSkillTest < FeatureTest
  def test_user_can_delete_a_skill
    skip
    SkillInventory.create({name: "pokemon", status: "ash"})
    visit "/skills"
    click_button("delete")
    assert_equal "/skills", current_path
  end
end
