class Customer < ApplicationRecord
    belongs_to :user
    # has_many :intervention
    has_many :buildings
    has_one :address

    after_create :dropbox_file
    after_update :dropbox_file

    # Dropbox::API::Config.app_key(ENV["dropbox_app_key"])
    # Dropbox::API::Config.app_secret(ENV["dropbox_app_secret"])


    def dropbox_file
        client = DropboxApi::Client.new(ENV["dropbox_token"])
        Lead.where(email: self.cpy_contact_email).each do |lead|
            if !lead.file_attachment.nil?
                directory = "/" + self.cpy_contact_full_name
                begin
                    client.create_folder directory
                rescue DropboxApi::Errors::FolderConflictError => err
                    
                end
                begin
                    client.upload(directory + "/" + lead.filename, lead.file_attachment)
                rescue DropboxApi::Errors::FileConflictError => err

                end

                lead.file_attachment = nil;
                lead.filename = nil;
                lead.save!
            end
        end
    end
end
