class SkillInventory
  def self.database
    if ENV["RACK_ENV"] == "test"
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.dataset
    database.from(:skills)
  end

  def self.create(skill)
    dataset.from(:skills).insert(name: skill[:name], status: task[:status])
  end


  def self.update(id, data)
    task = dataset.from(:skills).where(:id => id)
    task.update(:name => data[:name], :status => data[:status])
  end

  def self.raw_skills
    database.transaction do
      database['skills'] || []
    end
  end

  def self.all
    skills = dataset.from(:skills).to_a
    skills.map {|data| Skill.new(data)}
  end

  def self.raw_skill(id)
    raw_skills.find { |skill| skill["id"] == id }
  end

  def self.find(id)
    Skill.new(raw_skill(id))
  end

  def self.delete(id)
    database.transaction do
      database['skills'].delete_if {|skill| skill["id"] == id}
    end
  end
end
