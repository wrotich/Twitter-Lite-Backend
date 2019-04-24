class TimeDiffCalc
  attr_reader :created_at
  class << self
    def call(created_at)
      new(created_at).call
    end
  end
  def initialize(created_at)
    @created_at = created_at
  end

  def call
    time_diff
  end

  private

  def time_diff
    return created_at.strftime('%A, %B %e') if time_diff_hours > 24
    min_hours_conversion
  end

  def min_hours_conversion
    if time_diff_hours < 1
      time_posted = time_diff_hours * 60
      time_posted.truncate(0).to_s + ' minutes ago'
    else
      time_diff_hours.truncate(0).to_s + ' hours ago'
    end
  end

  def time_diff_hours
    time_now_sec = Time.now - created_at
    time_now_sec / 3600
  end
end
