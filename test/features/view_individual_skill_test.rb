require_relative "../test_helper"

class IndiSkilltest < FeatureTest
  def test_user_can_view_indiviual_task
    SkillInventory.create({name: "pokemon", status: "ash"})
    skill = SkillInventory.all.last
    visit "/skills"


    click_link("pokemon")

    assert_equal "/skills/#{skill.id}", current_path
  end
end
