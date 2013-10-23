module UrlsHelper

  $array = [('a'..'z'), ('A'..'Z'), (0..9)].map { |i| i.to_a }.flatten

  def magic_url_minifier
    (1..5).map { $array[rand($array.length)] }.join
  end
end
