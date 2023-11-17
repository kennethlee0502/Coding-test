class Item < ApplicationRecord
    # Default scope to exclude soft-deleted records
    default_scope { where(deleted_at: nil) }
  
    def soft_delete
      update(deleted_at: Time.current)
    end
  
    def restore
      update(deleted_at: nil)
    end
  end
  