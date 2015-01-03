json.array!(@workers) do |worker|
  json.extract! worker, :id, :title, :content, :user_id, :salary_requirement, :job_status, :job_status_etc, :dev_languages, :dev_duration, :dev_web, :dev_system, :dev_smart, :dev_history, :community_activity, :book_author, :book_trans
  json.url worker_url(worker, format: :json)
end
