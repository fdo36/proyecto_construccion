require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  def test_true_is_true
  	assert true
  end

  def test_should_not_save_role_without_name
  	role = Role.new
  	assert !role.save
  end
end
