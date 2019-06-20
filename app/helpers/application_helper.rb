module ApplicationHelper

  def medium_helper medium
    if medium == "Podcast"
      image_tag("podcast-medium.png", class: "medium-icon")
    elsif medium == "Tweet"
      image_tag("twitter-medium.png", class: "medium-icon")
    elsif medium == "Book"
      image_tag("book-medium.png", class: "medium-icon")
    elsif medium == "Video"
      image_tag("youtube-medium.png", class: "medium-icon")
    elsif medium == "Online Article"
      image_tag("article-medium.png", class: "medium-icon")
    elsif medium == "Newsletter"
      image_tag("mail-medium.png", class: "medium-icon")
    elsif medium == "Other"
      image_tag("podcast-medium.png", class: "medium-icon")
    end
  end
end


# ["Podcast", "Tweet", "Book", "Video", "Online Article", "Newsletter", "Other"]
