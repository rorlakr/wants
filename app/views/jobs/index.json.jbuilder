json.array!(@jobs) do |job|
  json.extract! job, :id, :company, :intro, :from, :to, :always, :contact, :user_id
  json.url job_url(job, format: :json)
end
