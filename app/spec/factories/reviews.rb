FactoryBot.define do
  factory :review1, class: 'Review' do
    id             { 1 }
    item_id        { 2 }
    reviewer_name  { "Reviewer1" }
    review_comment { "Reviewer1's Comment" }
    review_rating  { 4.7 }
    price_rating   { 5 }
    design_rating  { 4 }
    quality_rating { 5 }
  end
  factory :review2, class: 'Review' do
    id             { 2 }
    item_id        { 3 }
    reviewer_name  { "Reviewer2" }
    review_comment { "Reviewer2's Comment" }
    review_rating  { 1.7 }
    price_rating   { 2 }
    design_rating  { 1 }
    quality_rating { 2 }
  end
  factory :review3, class: 'Review' do
    id             { 3 }
    item_id        { 3 }
    reviewer_name  { "Reviewer3" }
    review_comment { "Reviewer3's Comment" }
    review_rating  { 2.3 }
    price_rating   { 1 }
    design_rating  { 2 }
    quality_rating { 4 }
  end
end
