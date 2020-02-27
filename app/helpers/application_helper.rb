module ApplicationHelper

  def review(art)
    if art.reviews.size == 1
      ' Review'
    else
      ' Reviews'
    end
  end

  def count_stars(art)
    sum = art.reviews.reduce(0) { |total, review| total + review.rating }
    if sum != 0
      stars(sum / art.reviews.size) + ' ' + '(' + art.reviews.size.to_s + review(art) + ')'
    else
      'No Reviews'
    end
  end

  def stars(num)
    ('★ ' * num) + (' ✩' * (5 - num))
  end

  def photo(art)
    if art.photo.attached?
      cl_image_tag art.photo.key, height: 400, width: 600, crop: :fill, :radius=>1, :color=>"#DAE3E5", :effect=>"shadow:5", :x=>1, :y=>1
    else
      '<img src="https://images.artnet.com/aoa_lot_images/129903/keith-haring-untitled-from-pop-shop-ii-prints-and-multiples.jpg" alt="" height="400" width="600">'.html_safe
    end
  end

  def has_reviews?(art)
    !art.reviews.empty?
  end

  def numbers(price)
    # a = price.to_s.chars.reverse
    # b = a.map.with_index do |x, i|
    #   if (i + 1) % 3 == 0 && i + 1 != 0
    #     a.insert(i + 2, '.')
    #   end
    # end
    # a
    x = price.to_s.chars.reverse
    z = x.map.with_index do |a, i|
      if i % 3 == 0 && i != 0
        a + '.'
      else
        a
      end
    end

    z.reverse.join
  end
end
