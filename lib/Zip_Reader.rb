require 'rubygems'
require 'zip/zip'

class Zip_Reader

  def initialize fn
    @zip_filename = fn
  end

  def read_files
    @filenames = []
    Zip::ZipFile.open(@zip_filename) do |zip_file|
      zip_file.each do |f|
        if f.file? then
          @filenames << f
        end
      end
    end
  end

  def filenames
    @filenames
  end
end
