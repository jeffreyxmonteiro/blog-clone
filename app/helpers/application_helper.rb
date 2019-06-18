module ApplicationHelper

  def medium_helper medium
    if medium == "Podcast"
    elsif medium == "Tweet"
    elsif medium == "Book"
    elsif medium == "Video"
    elsif medium == "Online Article"
    elsif medium == "Newsletter"
    elsif medium == "Other"
    end
  end
end


# ["Podcast", "Tweet", "Book", "Video", "Online Article", "Newsletter", "Other"]
