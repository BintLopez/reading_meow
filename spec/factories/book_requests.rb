FactoryBot.define do
  factory :book_request do
    status "accepted"
    accepted_at "2018-03-31 22:23:43"
    delivery_date "2018-03-31"
    cat { create(:cat) }
    cat_reading_wrangler { create(:cat_reading_wrangler) }
    request_data { { num_books: 3, genre: 'biography' } }

    trait :new_request do
    	status 'requested'
    	accepted_at nil
    	request_data { { num_books: 5, genre: 'romance' } }
    	delivery_date nil
    end

    trait :accepted do
    	status 'accepted'
    	accepted_at   { Time.now }
    	request_data  { { num_books: 3, genre: 'horror' } }
    	delivery_date { Date.today }
    end

    trait :delivered do
    	status 'delivered'
    	delivered_at { Time.now }
    	request_data  { { num_books: 3, genre: 'horror' } }
    	delivery_date { Date.today }
    	accepted_at { Time.now - 1.week }
    end

    trait :picked_up do
    	status 'picked_up'
    	picked_up_at { Time.now }
    end

    trait :completed do
    	status 'completed'
    end

    trait :cancelled do
    	status 'cancelled'
    end
  end
end
