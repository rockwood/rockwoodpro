module PageFinder
  def method_missing(meth, *args, &block)
    if meth =~ /_page$/ && args.empty?
      page_object_for(meth)
    else
      super
    end
  end

  def page_object_for(page_name)
    class_name = page_name.to_s.camelize
    class_name.constantize.new
  rescue NameError => e
    raise "No page defined with name #{class_name}"
  end
end
