require 'test_helper'

class CreateBookJobTest < ActiveSupport::TestCase
    context 'perform' do
        should 'create book' do
          pp "================ delayed_job_test =================="
            assert_difference('Book.count', 1) do
                CreateBookJob.new('book 23', 2000, Author.last.id).perform
            end
            assert Book.where(title: 'book 23').exists?
        end
    end

end
