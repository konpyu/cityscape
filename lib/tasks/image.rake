def purge_image
  if Image.count > 9500
    Image.order(id: :desc).limit(500).delete_all
  end
end

namespace :image do
  task fetch: :environment do
  end
end
