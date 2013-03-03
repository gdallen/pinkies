class CreateCharacterCountView < ActiveRecord::Migration
  def up
    execute <<-SQL
      create view charactercounts as 
	select projects.id*10 + keystrokes.order as id,
          # concat(projects.id, keystrokes.order), 
          projects.name as project, charmaps.keystroke, 
          sum(characters.count) as count
	from projects inner join datafiles on datafiles.project_id = projects.id
	  inner join characters on characters.datafile_id = datafiles.id 
	  inner join charmaps on characters.letter = charmaps.letter
	  inner join keystrokes on charmaps.keystroke = keystrokes.keystroke
	group by projects.name, charmaps.keystroke 
	order by projects.name, keystrokes.order
    SQL
  end

  def down
    execute <<-SQL
      drop view charactercounts
    SQL
  end
end
