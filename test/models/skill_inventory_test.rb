require_relative '../test_helper'
class SkillInventoryTest < Minitest::Test

  def test_skill_is_created
    SkillInventory.create({:name       => "My name",
                        :status => "get stuff done"})

    skill = SkillInventory.find(SkillInventory.all.first.id)

    assert_equal SkillInventory.all.first.id, skill.id
    assert_equal "My name", skill.name
    assert_equal "get stuff done", skill.status
  end

  def test_it_can_find_the_skill_id
    SkillInventory.create({:name       => "My name",
                        :status => "get stuff done"})

    skill = SkillInventory.find(SkillInventory.all.first.id)
    assert_equal "My name", SkillInventory.find(SkillInventory.all.first.id).name
  end


  def test_you_can_delete_a_skill

    SkillInventory.create({:name       => "My name",
                        :status => "get stuff done"})

    SkillInventory.create({:name       => "Pokemon",
                        :status => "charizard"})

    SkillInventory.create({:name       => "ash",
                        :status => "snorlax"})

    total = SkillInventory.all.count

    SkillInventory.delete(2)
    SkillInventory.delete(SkillInventory.all.first.id)

    assert_equal  (total-1), SkillInventory.all.count
  end

  def test_you_can_update_a_skill
    SkillInventory.create({:name         => "Pokemon",
                         :status  => "charizard"})

   SkillInventory.update(SkillInventory.all.first.id, {name: "new name", status: "new status"})

   skill = SkillInventory.find(SkillInventory.all.first.id)

   assert_equal "new name", skill.name
   assert_equal "new status", skill.status
  end

  def test_it_can_show_call_of_our_skill
    SkillInventory.create({:name        => "My name",
                         :status => "get stuff done"})

    SkillInventory.create({:name        => "Pokemon",
                         :status => "charizard"})

    SkillInventory.create({:name        => "ash",
                         :status => "snorlax"})

    assert_equal ["My name", "Pokemon", "ash"], SkillInventory.all.map{|skill| skill.name}
  end
end
