class MailTemplate
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def self.recording_confirmation(options)
    template = File.read(Rails.root.join('app', 'views', 'recording_mailer', 'confirmed.md.erb'))
    new(
      to: options.fetch(:to),
      subject: options.fetch(:subject, "Rockwood Productions - Your Recording"),
      body: parse_erb(template, recording: options.fetch(:recording)),
    )
  end

  def self.parse_erb(template, context)
    parser = ERB.new(template)
    binding = ERBContext.new(context).get_binding
    parser.result(binding)
  end

  attr_reader :to, :subject, :body
  attr_accessor :deliver

  def initialize(options)
    @to = options.fetch(:to)
    @body = options.fetch(:body)
    @subject = options.fetch(:subject)
  end
end
