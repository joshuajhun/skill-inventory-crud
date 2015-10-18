require_relative "../test_helper"

class IndiSkilltest < FeatureTest
  def test_user_can_view_indiviual_task
    skip
    SkillInventory.create({name: "pokemon", status: "ash"})
    visit "/skills"


    click_link("pokemon")

    assert_equal "/skills/1", current_path
  end
end
