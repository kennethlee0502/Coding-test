require 'rails_helper'

RSpec.describe Item, type: :model do
  it 'soft deletes the item' do
    item = Item.create(name: 'Test Item')
    item.soft_delete
    expect(item.deleted_at).not_to be_nil
  end

  it 'restores the item' do
    item = Item.create(name: 'Test Item', deleted_at: Time.current)
    item.restore
    expect(item.deleted_at).to be_nil
  end

  it 'excludes soft-deleted items from default scope' do
    Item.create(name: 'Test Item', deleted_at: Time.current)
    expect(Item.all).to be_empty
  end
end
