json.extract! post, :id, :bands, :time, :event_date, :membership_required, :Suggested_Donation, :Genre, :created_at, :updated_at
json.url post_url(post, format: :json)
