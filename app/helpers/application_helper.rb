module ApplicationHelper
  def generate_confirmation_code
    (0...10).map { ('a'..'z').to_a[rand(26)] }.join.upcase
  end
end
