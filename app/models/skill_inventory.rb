class SkillInventory
  def self.database
    if ENV["RACK_ENV"] == 'test'
      @database ||= Sequel.sqlite("db/skill_inventory_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/skill_inventory_development.sqlite3")
    end
  end

  def self.create(skill)

    # database.transaction do
    #   database['skills'] ||= []
    #   database['total'] ||= 0
    #   database['total'] += 1
    #   database['skills'] << { "id" => database['total'], "name" => skill[:name], "status" => skill[:status] }
    # end
  end

  def self.all
    raw_skills.map { |data| Skill.new(data) }
  end

  def self.raw_skills

    # database.transaction do
    #   database['skills'] || []
    # end
  end

  def self.raw_skill(id)
    raw_skills.find { |skill| skill["id"] == id }
  end

  def self.find(id)
    Skill.new(raw_skill(id))
  end

  def self.update(id, data)

    # database.transaction do
    #   target = database['skills'].find { |skill| skill["id"] == id }
    #   target["name"] = data[:name]
    #   target["status"] = data[:status]
    # end
  end

  def self.delete(id)

    # database.transaction do
    #   database['skills'].delete_if { |skill| skill["id"] == id }
    # end
  end

  def self.delete_all
    
    # database.transaction do
    #   database['skills'] = []
    #   database['total'] = 0
    # end
  end

end
