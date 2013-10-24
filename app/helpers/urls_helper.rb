module UrlsHelper

  $array = [('a'..'z'), ('A'..'Z'), (0..9)].map { |i| i.to_a }.flatten

  def magic_url_minifier
    (1..5).map { $array[rand($array.length)] }.join
  end

  def new_visit
    visit = Visit.find_by_url_id(@url.id)
    visit.count += 1
    visit.save
  end

end
