require_relative '../test_helper'

class SkillInventoryTest < Minitest::Test
  def test_it_creates_a_task
    SkillInventory.create({ :name   => "a name",
                            :status => "a status"})
    skill = SkillInventory.find(1)
    assert_equal "a name", skill.name
    assert_equal "a status", skill.status
    assert_equal 1, skill.id
  end

  def test_it_updates_a_task
    skip
    SkillInventory.create({ :name   => "a name",
                            :status => "a status"})
    skill = SkillInventory.find(1)
    assert_equal 1, skill.id
    assert_equal "a name", skill.name
    data = {  :name => "updated name",
              :status => "updated status" }
    SkillInventory.update(1, data)
    updated_skill = SkillInventory.find(1)
    assert_equal "updated name", updated_skill.name
    assert_equal "updated status", updated_skill.status
  end

  def teest_it_deletes_a_task
    skip
    SkillInventory.create({ :name   => "a name",
                            :status => "a status"})
    SkillInventory.create({ :name   => "second name",
                            :status => "second status"})
    skills = SkillInventory.all
    assert_equal 2, skills.count
    SkillInventory.delete(1)
    remaining_skills = SkillInventory.all
    assert_equal 1, remaining_skills.count
  end

  def test_find_returns_specific_skills
    skip
    SkillInventory.create({  :name => "First name",
                             :status => "first status" })
    SkillInventory.create({  :name => "Second name",
                             :status => "second status" })
    skill_1 = SkillInventory.find(1)
    skill_2 = SkillInventory.find(2)
    assert_equal "First name", skill_1.name
    assert_equal "Second name", skill_2.name
    assert_equal "first status", skill_1.status
    assert_equal "second status", skill_2.status
  end

  def test_all_returns_all_skills
    skip
    SkillInventory.create({  :name => "First name",
                             :status => "first status" })
    SkillInventory.create({  :name => "Second name",
                             :status => "second status" })
    skills = SkillInventory.all
    assert_equal 1, skills[0].id
    assert_equal 2, skills[1].id
    assert_equal 2, skills.count
  end
end
