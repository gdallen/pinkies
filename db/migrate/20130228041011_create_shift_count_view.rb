class CreateShiftCountView < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view shiftcounts as
       select projects.id*10 + keystrokes.order as id,
          projects.name as project, shiftmaps.keystroke, 
          sum(characters.count) as count
        from projects inner join datafiles on datafiles.project_id = projects.id
          inner join characters on characters.datafile_id = datafiles.id 
          inner join shiftmaps on binary characters.letter = binary shiftmaps.letter
          inner join keystrokes on shiftmaps.keystroke = keystrokes.keystroke
        group by projects.name, shiftmaps.keystroke 
        order by projects.name, keystrokes.order
    SQL
  end

  def down
    execute <<-SQL
    
      drop view shiftcounts
    SQL
  end
end
