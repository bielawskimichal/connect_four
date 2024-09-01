# frozen_string_literal: true

class Player
  def to_s
    puts @marker
  end

  def create_marker(suffix)
    @marker = "u26a#{suffix}".encode('utf-8')
  end
end
