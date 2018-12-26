# frozen_string_literal: true

class ConnectedList

  REDIS_KEY = "connected_users_"

  def self.redis
    @redis ||= ::Redis.new(url: ActionCableConfig[:url])
  end

  def self.clear_all
    keys = redis.keys.select { |key| key.starts_with?(REDIS_KEY) }
    keys.each { |key| redis.del(key) }
  end

  def self.all(chat_id)
    redis.smembers(REDIS_KEY + chat_id.to_s)
  end

  def self.clear(chat_id)
    redis.del(REDIS_KEY + chat_id.to_s)
  end

  def self.add(chat_id, user_id)
    redis.sadd(REDIS_KEY + chat_id.to_s, user_id)
  end

  def self.include?(chat_id, user_id)
    redis.sismember(REDIS_KEY + chat_id.to_s, user_id)
  end

  def self.remove(chat_id, user_id)
    redis.srem(REDIS_KEY + chat_id.to_s, user_id)
  end

end
