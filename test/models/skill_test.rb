ENV['RACK_ENV'] ||= 'test'
require_relative "../test_helper"

class SkillTest < Minitest::Test
  def test_attributes_are_assigned_correctly
    skip
    skill = Skill.new({'id'=> "1",
                    "name"=> "My skill",
                    "status" => "get stuff done"})
    assert_equal "1", skill.id
    assert_equal "My skill", skill.name
    assert_equal "get stuff done", skill.status
  end
end
