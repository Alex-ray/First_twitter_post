helpers do

  def twitter_oauth
    @twitter_oauth ||= TwitterOauth.new(session, to('/authorize_via_twitter/callback'))
  end

  def logout 
    twitter_oauth.logout
    session.clear
  end

  def job_is_complete(jid)
    waiting = Sidekiq::Queue.new
    working = Sidekiq::Workers.new
    pending = Sidekiq::ScheduledSet.new
    return false if pending.find { |job| job.jid == jid }
    return false if waiting.find { |job| job.jid == jid }
    return false if working.find { |worker, info| info["payload"]["jid"] == jid }
    true
  end



end
