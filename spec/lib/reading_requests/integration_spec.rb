require 'rails_helper'
require 'reading_requests/initiate'

RSpec.describe "Reading Requests End to End Integration Test" do
  # An eligible cat can make a request for books,
  # specifying certain request_data, including...

  #  * number of books
  #  * genre
  #  * urgency tier
  #    * 'asap' within 2 days, 'regular' within 5, 'low' within 10

  # Cat is ineligible if they...
  #  * currently have books out
  #  * have any unpaid fines
  #  * have damaged too many past books

  # The models/tables we need to tie together are
  #   * BookRequest
  #   * Checkout
  #   * BookCheckout
  #   * Book
  #   * Library
  #   * Cat
  #   * CatReadingWrangler

  # A book request can be in the following statuses...
  #   'initiated'
  #   'accepted'
  #   'checked_out'
  #   'delivered'
  #   'picked_up'
  #   'returned'
  #   'canceled'

  # A book request is considered live if its in any status
  # other than canceled or returned


  # ### The Lifecycle of a Reading Request

  # Initiating a request
  #   * prevents creation of a book request for an ineligible cat
  #   * creates a book request associated to the cat
  #   * book request should be in initiated status
  #   * notifies all available wranglers

  # Accepting a request
  #   * a wrangler can accept an initiated request
  #   * accepting a request logs the accepted_at date
  #   * and upates the status to accepted
  #   * updates the book request delivery date
  #   * notifies the cat of the delivery date

  # Cancel a request
  #   * a request can be canceled up until it's checked out
  #   * checkout is the point of no return!

  # Checking Out from the Library
  #   * creates books if they're not in our system yet
  #   * creates a checkout
  #   * creates a book checkout for each book checked out
  #     recording the date, action, and condition of the book

  # Delivery to the Cat
  #   * logs the delivered at
  #   * updates the status

  # Pick up from the Cat
  #   * logs the picked up at
  #   * updates the status

  # Return to the Library
  #   * updates the checkout
  #   * creates a book checkout to log condition and return date
end