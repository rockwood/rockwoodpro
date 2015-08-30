class AdminEmailPage < Page
  def submit(options = {})
    if options[:deliver_email] == false
      choose("No")
    end

    if options[:subject]
      find("#mail_template_subject").set(options[:subject])
    end

    if options[:body]
      textarea = find("#mail_template_body")
      textarea.set(textarea.value + options[:body])
    end

    find("input[type=submit]").click
  end
end
