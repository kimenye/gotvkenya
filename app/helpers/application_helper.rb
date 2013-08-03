module ApplicationHelper
  def is_facebook_fan(params)
    unless params['signed_request'].nil? #are we viewing on facebook or not?
      p = params['signed_request'].split('.')[1]
      json = Base64.decode64(p + "=" * (4 - p.size % 4))
      data = ActiveSupport::JSON.decode(json)
      liked = data["page"]["liked"]
    end
  end
end
