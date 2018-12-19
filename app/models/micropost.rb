class Micropost < ApplicationRecord
  acts_as_taggable
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

  def self.create_from_xml(user, xml)
    content = xml.css("content").text
    Micropost.new(content: content, user_id: user.id).save
  end

  def xml_data(xml)
    xml.micropost {
      xml.content self.content
    }
  end

  private

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
