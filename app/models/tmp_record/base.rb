module TmpRecord
  class Base
    attr_accessor :name, :value, :ttl_seconds
    alias_method :id, :name

    def save
      Redis.current.set(key, self)
    end

    protected

    def class_cache_key
      self.class.name.tableize
    end

    def key
      "tmp_record:#{class_cache_key}:#{id}"
    end
  end
end
