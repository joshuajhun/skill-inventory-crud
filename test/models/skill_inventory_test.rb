require_relative '../test_helper'
class SkillInventoryTest < Minitest::Test

  def test_skill_is_created
    skip
    SkillInventory.create({:name       => "My name",
                        :status => "get stuff done"})

    skill = SkillInventory.find(1)

    assert_equal 1, skill.id
    assert_equal "My name", skill.name
    assert_equal "get stuff done", skill.status
  end

  def test_it_can_find_the_skill_id
    skip
    SkillInventory.create({:name       => "My name",
                        :status => "get stuff done"})

    skill = SkillInventory.find(1)
    assert_equal 1, skill.id
  end

  def test_it_can_find_an_id_within_multiple_ids
    skip
    SkillInventory.create({:name       => "My name",
                        :status => "get stuff done"})

    SkillInventory.create({:name       => "Pokemon",
                        :status => "charizard"})

    SkillInventory.create({:name       => "Pokemon",
                        :status => "snorlax"})

    skill = SkillInventory.find(2)

    assert_equal 2, skill.id
    assert_equal "Pokemon", skill.name
    assert_equal "charizard", skill.status
  end

  def test_you_can_delete_a_skill
    skip
    SkillInventory.create({:name       => "My name",
                        :status => "get stuff done"})

    SkillInventory.create({:name       => "Pokemon",
                        :status => "charizard"})

    SkillInventory.create({:name       => "ash",
                        :status => "snorlax"})

    SkillInventory.delete(2)

    assert_equal  ['My name',"ash"], SkillInventory.all.map{|skill| skill.name}
  end

  def test_you_can_update_a_skill
    skip
    SkillInventory.create({:name         => "Pokemon",
                         :status  => "charizard"})

    SkillInventory.update(1,{:name       =>"ash",
                          :status => "oak"})

    skill = SkillInventory.find(1)

    assert_equal "ash", skill.name
    assert_equal "oak", skill.status
  end

  def test_it_can_show_call_of_our_skill
    skip
    SkillInventory.create({:name        => "My name",
                         :status => "get stuff done"})

    SkillInventory.create({:name        => "Pokemon",
                         :status => "charizard"})

    SkillInventory.create({:name        => "ash",
                         :status => "snorlax"})

    assert_equal ["My name", "Pokemon", "ash"], SkillInventory.all.map{|skill| skill.name}
  end
end
