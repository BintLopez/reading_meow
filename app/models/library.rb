class Library < ApplicationRecord
	has_many :contacts, as: :contactable

  def return_window_days
    # TODO
    # This is a magic number -- a nice lil code smell
    # for you to refactor!

    # 1. Write a test that will make this fail
    #    Let's say we expect library X to have a
    #    14 day return window, while library Q has
    #    an 8 day window

    # 2. Refactor this code to make this test pass!
    14
  end
end
