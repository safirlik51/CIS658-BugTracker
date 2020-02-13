require 'test_helper'

class BugTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
def setup
  @bug = Bug.create(title: 'Why are there so many bugs in here?', description: 'Because you left the darn window open Bob...')
end

def test_notitle
  @bug.title = ''
  assert_not @bug.valid?
 end

def test_nodescription
  @bug.description = ''
  assert_not @bug.valid?
end

end
