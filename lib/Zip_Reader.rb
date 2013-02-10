require 'rubygems'
require 'zip/zip'

class Zip_Reader

  def initialize fn
    @zip_filename = fn
    @file_counts = {}
  end

  def read_files
    @filenames = []
    Zip::ZipFile.open(@zip_filename) do |zip_file|
      zip_file.each do |f|
        if f.file? then
          @filenames << f.to_s
          @file_counts[f.to_s] = count_file f
        end
      end
    end
  end

  def filenames
    @filenames
  end
  
  def count_file f
    char_counter = Char_Counter.new
    f.get_input_stream.each_line do |l|
      char_counter.count_characters l
    end
    char_counter.charmap
  end

  def count fn, l
    file_counts = @file_counts[fn]
    return file_counts [l] || 0 if nil != file_counts
    0
  end

  def counts fn
    @file_counts[fn]
  end
end
