module RubyRedInk
  class VariableReference < RuntimeObject
    attr_accessor :name, :path_for_count

    def container_for_count
      return self.resolve_path(self.path_for_count).container
    end

    def path_string_for_count
      if path_for_count.nil?
        return nil
      end

      return compact_path_string(path_for_count)
    end

    def path_string_for_count=(value)
      if value.nil?
        path_for_count = nil
      else
        path_for_count = Path.new(value)
      end
    end

    def initialize(name)
      self.name = name
    end

    def as_string
      if !name.nil?
        return "var(#{name})"
      else
        return "read_count(#{path_string_for_count})"
      end
    end
  end
end