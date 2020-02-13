require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
def setup
  @bug = Bug.create(title: 'Why are there so many bugs in here?', description: 'Because you left the darn window open Bob...')
end

test "post must be valid" do
	assert @bug.valid?
end

test "title must be present" do
	@bug.title = ""
	assert_not @bug.valid?
end

test "description must be present" do
	@bug.description = ""
	assert_not @bug.valid?
end

test "issue_type must be valid" do
	true_issue = [:issue, :enhancement, :feature]
	true_issue.each do |is|
		begin
			@bug.issue_type = is
			assert true
		rescue
			assert false, "#{is} should be invalid"
		end
	end
end

test "priority must be valid" do
	true_priority = [:low, :medium, :high]
	true_priority.each do |is|
		begin
			@bug.priority = is
			assert true
		rescue
			assert false, "#{is} should be invalid"
		end
	end
end

test "status must be valid" do
	true_status = [:open, :closed, :monitor]
	true_status.each do |is|
		begin
			@bug.status = is
			assert true
		rescue
			assert false, "#{is} should be invalid"
		end
	end
end

test "must have default values" do
	assert_equal(@bug.issue_type, "feature")
	assert_equal(@bug.priority, "medium")
	assert_equal(@bug.status, "open")
end

end
