class MailTemplate
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def self.recording_confirmed(options)
    new(
      to: options.fetch(:to),
      subject: options.fetch(:subject, "Rockwood Productions - Your Recording"),
      body: parse_erb(read_template('recording_confirmed.md.erb'), recording: options.fetch(:recording)),
    )
  end

  attr_reader :to, :subject, :body
  attr_accessor :deliver

  def initialize(options)
    @to = options.fetch(:to)
    @body = options.fetch(:body)
    @subject = options.fetch(:subject)
  end

  def body_html
    markdown.render(@body)
  end

  def deliver
    Mailer.from_mail_template(self).deliver_now
  end

  private

  def self.read_template(template_name)
    File.read(Rails.root.join('app', 'views', 'mail_templates', template_name))
  end

  def self.parse_erb(template, context)
    parser = ERB.new(template)
    binding = ERBContext.new(context).get_binding
    parser.result(binding)
  end

  def markdown
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  end
end
