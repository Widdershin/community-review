module Secret
  def self.key
    ENV['AUTOPOSTER_KEY']
  end
end
