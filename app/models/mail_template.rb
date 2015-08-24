class MailTemplate
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  def self.confirmation(recording)
    template = File.read(Rails.root.join('app', 'views', 'recording_mailer', 'confirmed.md.erb'))
    parser = ERB.new(template)
    binding = ERBContext.new(recording: recording).get_binding
    new(recording: recording, body: parser.result(binding))
  end

  attr_reader :recording, :subject, :body
  attr_accessor :deliver

  def initialize(options)
    @recording = options.fetch(:recording)
    @subject = options.fetch(:subject, "Rockwood Productions - Your Recording")
    @body = options.fetch(:body)
  end
end
