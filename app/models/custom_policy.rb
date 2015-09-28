module CustomPolicy
  def apply_custom_policy(policy)
    self.singleton_class.class_eval do
      include policy
    end

    def method_missing(name, *args, &block)
      if name.match /policy$/
        return true
      end
      super
    end

  end
end