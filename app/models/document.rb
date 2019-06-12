class Document < ApplicationRecord
  has_one_attached :file

  validates_uniqueness_of :title
  validates_presence_of :title
  validate :file_presence
  validate :file_uniqueness

  private

  def file_presence  
    unless file.attached?
      errors[:base] << 'No file chosen. A file must be provided'
      file.purge
    end
  end

  def file_uniqueness 
    documents = Document.all
    documents.each do |doc|
      if file.attached?
        if doc.file.filename == self.file.filename
          errors[:base] << 'File already uploaded'
          file.purge
        end
      end
    end
  end
end
