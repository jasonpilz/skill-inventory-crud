require_relative '../test_helper'

class NewSkillTest < FeatureTest
  def test_user_can_create_a_skill
    skip
    visit "/skills/new"
    assert_equal "/skills/new", current_path

    fill_in("skill[name]", with: "new skill")
    fill_in("skill[status]", with: "new status")
    click_button "submit"
    assert_equal "/skills", current_path
    assert page.has_content?("new skill")
  end
end
