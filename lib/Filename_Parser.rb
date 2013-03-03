class Filename_Parser
  def find_extension fn
    file_ending = fn[/(?:.*\.)(.*$)/, 1] || ""
  end

  def should_be_processed? fn
    extension = find_extension fn
    extensions_to_process.include? extension
  end

  private
  @exts = nil
 
  def extensions_to_process
    if nil == @exts
      @exts = []
      @exts << "txt"
      @exts << "java"
      @exts << "xml"
      @exts << "clj"
      @exts << "cljs"
      @exts << "html"
      @exts << "vm"
    end
    @exts
  end
end
