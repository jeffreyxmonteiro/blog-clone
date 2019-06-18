module ApplicationHelper

  def medium_helper medium
    if medium == "Podcast"
      image_tag("podcast-float.png", class: "medium-icon")
    elsif medium == "Tweet"
      image_tag("twitter-float.png", class: "medium-icon")
    elsif medium == "Book"
      image_tag("book-float.png", class: "medium-icon")
    elsif medium == "Video"
      image_tag("youtube-float.png", class: "medium-icon")
    elsif medium == "Online Article"
      image_tag("article-float.png", class: "medium-icon")
    elsif medium == "Newsletter"
      image_tag("mail-float.png", class: "medium-icon")
    elsif medium == "Other"
      image_tag("podcast-float.png", class: "medium-icon")
    end
  end
end


# ["Podcast", "Tweet", "Book", "Video", "Online Article", "Newsletter", "Other"]
