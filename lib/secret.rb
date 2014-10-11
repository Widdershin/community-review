module Secret
  def self.key
    ENV['autoposter_key']
  end
end
