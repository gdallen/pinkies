module ProjectsHelper
  def get_character_counts
    cc = Charactercounts.group("keystroke").select("keystroke, sum(count) as count")
    count_map = {}
    Keystroke.order("\"order\"").map do |ks|
      count = cc.detect { |c| c.keystroke == ks.keystroke }
      count_map[ks.keystroke] = count && count.count || 0
    end
    count_map
  end
  def get_shift_counts
    sc = Shiftcounts.group("keystroke").select("keystroke, sum(count) as count")
    count_map = {}
    Keystroke.order("\"order\"").map do |ks|
      count = sc.detect { |c| c.keystroke == ks.keystroke }
      count_map[ks.keystroke] = count && count.count || 0
    end
    count_map
  end


  def get_project_character_counts p_id
    cc = Charactercounts.where(:project => Project.find(p_id).name)
    count_map = {}
    Keystroke.order("\"order\"").map do |ks|
      count = cc.detect { |c| c.keystroke == ks.keystroke }
      count_map[ks.keystroke] = count && count.count || 0
    end
    count_map
  end
  def get_project_shift_counts p_id
    sc = Shiftcounts.where(:project => Project.find(p_id).name)

    count_map = {}
    Keystroke.order("\"order\"").map do |ks|
      count = sc.detect { |c| c.keystroke == ks.keystroke }
      count_map[ks.keystroke] = count && count.count || 0
    end
    count_map
  end
end
