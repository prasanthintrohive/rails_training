require 'test_helper'

class BookTest < ActiveSupport::TestCase

    should 'create book' do
      FactoryBot.create(:book, :for_me)
        FactoryBot.create(:book, :for_others)
        assert_equal( 2, Book.count, ['book count did not increased by two'] )
    end

    context '#delete' do
      setup do
        FactoryBot.create(:book)
      end
      should 'decrement count' do
        assert_difference('Book.count', -1) do
          Book.last.delete
        end
      end
    end

    should 'create more book' do
      FactoryBot.create(:book)
        FactoryBot.create(:book)
        FactoryBot.create(:book)
        assert_equal( 3, Book.count, ['book count did not increased by two'] )
    end

    context 'expects example' do
      setup do
        FactoryBot.create(:book)
      end
      should 'raise expection' do
        assert_raises('ActiveRecord::RecordNotFound') do
          # binding.pry
          Book.find(title:"My book 1")
        end
      end
    end
end
