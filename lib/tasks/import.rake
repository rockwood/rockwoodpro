namespace :import do
  desc "Imports json from the old mongodb"
  task json: :environment do
    Importer.new.import!
  end

  class Importer
    def initialize
      @users = Hash.new
      @recordings = Hash.new
    end

    def import!
      import_users!
      import_recordings!
    end

    def import_users!
      JSON.parse(File.read('dump/users.json')).each do |obj|
        random = SecureRandom.hex(4)
        @users[obj["_id"]["$oid"]] = User.create!(
          first_name: obj['first_name'],
          last_name: obj['last_name'],
          email: obj['email'],
          admin: obj['admin'],
          password: random,
          password_confirmation: random,
          legacy: true)
      end
    end

    def import_recordings!
      JSON.parse(File.read('dump/recordings.json')).each do |obj|
        recording = Recording.create!(
          user: @users[obj['user_id']['$oid']],
          location: obj['location'],
          datetime: Time.at(obj['datetime']['$date'] / 1000).to_datetime,
          created_at: Time.at(obj['timestamp']['$date'] / 1000).to_datetime,
          directory: obj['s3_directory'],
          state: obj['status'] == 2 ? "finished" : "confirmed",
          level: obj['type'] == 0 ? "Audio and Video" : "Audio Only",
          context: obj['context'] == 0 ? "Live Performance" : "Private Recording Session",
          cds: obj['cds'],
          dvds: obj['dvds'])

        obj['files'].each_with_index do |file, i|
          recording.pieces.create!(
            track_number: i + 1,
            title: file['title'],
            filename: file['filename'],
            filetype: file['filetype'],
            created_at: Time.at(file['timestamp']['$date'] / 1000).to_datetime)
        end
      end
    end
  end
end