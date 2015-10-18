require_relative "../test_helper"
require_relative "../../app/models/skill_inventory"
class EditSkillTest < FeatureTest
  def test_user_can_edit_a_skill
    skip
    SkillInventory.create({name: "New Skill", status: "New Skill Des"})

    visit "/skills"

    click_link "Edit"

    assert_equal "/skills/1/edit", current_path

    fill_in "skill[name]", with: "Edited Skill"
    fill_in "skill[status]", with: "edidted Skill Des"
    click_button "update skill"

    assert page.has_content? "Edited Skill"
  end
end
