class Practice
  def initialize(trails)
    @trails = trails
  end

  def has_completed_trails?
    completed_trails.any?
  end

  def just_finished_trails
    trails.select(&:just_finished?)
  end

  def unstarted_trails
    trails.select(&:unstarted?)
  end

  def in_progress_trails
    trails.select(&:in_progress?)
  end

  private

  attr_reader :trails

  def completed_trails
    trails.select(&:complete?)
  end
end
