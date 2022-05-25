require "shrine"

require "shrine/storage/file_system"

shrine_storages = {
  cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
  store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),
}

Shrine.plugin :activerecord
Shrine.plugin :cached_attachment_data