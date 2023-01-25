FactoryBot.define do
    sequence(:my_title) {|n| "My Book #{n}" }
    sequence(:others_title) {|n| "Others Book #{n}" }
    sequence(:name) {|n| "aravind_raj #{n}" }
    factory :author, class: 'Author' do
        name { generate(:name) }
    end
    factory :book, class: 'Book' do
        author
        for_me
        trait :for_me do
            title { generate(:my_title) }
            published_year { 2000 }
            author_id {Author.last.id}
        end 
        trait :for_others do
            title { generate(:others_title) }
            published_year { 2002 }
            author_id {Author.last.id}
        end
    end
end