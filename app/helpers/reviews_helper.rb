module ReviewsHelper
  def review_stars(rating)
    total_rating = (rating * 5).ceil
    image_tag("stars/stars-f-#{total_rating}.gif")
  end
end
