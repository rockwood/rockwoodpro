class MailTemplate
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def self.recording_confirmed(options)
    build('recording_confirmed.md.erb', options)
  end

  def self.recording_finished(options)
    build('recording_finished.md.erb', options)
  end

  def self.build(template_name, options)
    template = File.read(Rails.root.join('app', 'views', 'mail_templates', template_name))
    new(
      to: options.fetch(:to),
      subject: options.fetch(:subject, "Rockwood Productions - Your Recording"),
      body: parse_erb(template, options)
    )
  end

  attr_reader :to, :subject, :body
  attr_accessor :deliver_email

  def initialize(options)
    @to = options.fetch(:to)
    @body = options.fetch(:body)
    @subject = options.fetch(:subject, "")
    @deliver_email = options[:deliver_email] == "1"
  end

  def body_html
    markdown.render(@body)
  end

  def process
    if @deliver_email
      UserMailer.from_mail_template(self).deliver_now
    end
  end

  private

  def self.parse_erb(template, context)
    parser = ERB.new(template)
    binding = ERBContext.new(context).get_binding
    parser.result(binding)
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
