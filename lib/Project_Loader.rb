#
class Project_Loader
  attr_accessor :project_name, :archive_name, :files

  def initialize pn, an
    @project_name = pn
    if (an != "") then
      @archive_name = an
    else
      read pn
      read_files 
    end
  end
 

  def process
    zr = Zip_Reader.new @archive_name
    zr.read_files
    @files = zr.filenames
    save zr
  end

  def save zr
    ar_project = Project.new
    ar_project.name = @project_name
    ar_project.archive = @archive_name
    ar_project.save
    p = Project.find_by_name @project_name

    filename_parser = Filename_Parser.new
    @files.each do |f|
      if filename_parser.should_be_processed? f then
        current_file = p.datafiles.create(:name => f, :status=> "processed")

        character_counts = zr.counts f
        character_counts.each_pair do |l, c|
          current_file.characters.create(:letter => l, :count => c)
        end
      else
        current_file = p.datafiles.create(:name => f, :status => "skipped")
      end
    end
  end

  def read n
    ar_project = Project.find_by_name n
    @project_name = ar_project.name
    @archive_name = ar_project.archive
    self
  end
  
  def read_files
    project = Project.find_by_name @project_name
    files = project.datafiles
    @files = []
    files.each { |f| @files << f.name }
    @files
  end

  def files
    @files
  end

  def counts fn
    project = Project.find_by_name @project_name
    file = project.datafiles.find_by_name fn
    chrs = file.characters.find_all
    r = {}
    chrs.each do |c|
      r[c.letter] = c.count
    end
    r
  end
end
