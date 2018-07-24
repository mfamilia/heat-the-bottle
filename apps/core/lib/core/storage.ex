defmodule Core.Storage do
  @table :data

  def set(key, value) do
    PersistentStorage.put(@table, key, value)
  end

  def get(key) do
    PersistentStorage.get(@table, key)
  end
end
