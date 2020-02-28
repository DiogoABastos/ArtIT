module ApplicationHelper

  def review(art)
    if art.reviews.size == 1
      ' Review'
    else
      ' Reviews'
    end
  end

  def people(channel)
    if channel.users.size == 1
      ' person'
    else
      ' people'
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

  def num_days(rental_start, rental_end)
    rental_end.day - rental_start.day
  end

  def days_left(rental)
    time = rental.rental_end.day - Time.now.day
    art = rental.art
    if time > 0
      time
    else
      art.available = true
      art.save
      'Completed 😂'
    end
  end

  def total_price(art, rental_start, rental_end)
    if num_days(rental_start, rental_end).is_a? Integer
      num_days = num_days(rental_start, rental_end)
      numbers(art.price * num_days) + ' $'
    else

    end
  end

  def time_pass(art)
    time = Time.now - art.created_at

    if time < 5
      'Just now'
    elsif time < 60
      time.round.to_s + ' seconds ago'
    elsif time < 60 * 60
      if (time / 60).round ==  1
        '1 min ago'
      else
        (time / 60).round.to_s + ' mins ago'
      end
    elsif time < 60 * 60 * 24
      if (time / (60 * 60)).floor == 1
        '1 hour ago'
      else
        (time / (60 * 24)).round.to_s + ' hours ago'
      end
    elsif time < 60 * 60 * 24 * 7
      if (time / (60 * 60 * 24)).floor == 1
        '1 day ago'
      else
        (time / (60 * 60 * 24)).round.to_s + ' days ago'
      end
    else
      'More than a week ago'
    end
  end
end
