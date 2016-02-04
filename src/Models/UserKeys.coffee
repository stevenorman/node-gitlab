BaseModel = require '../BaseModel'

class UserKeys extends BaseModel
  all: (userId, fn = null) =>
    @get "users/#{parseInt userId}/keys", (data) => fn data if fn

  addKey: (userId, title, key, fn = null) =>
    params =
      title: title
      key: key

    @post "users/#{userId}/keys", params, (data) -> fn data if fn

  deleteKey: (userId, keyId, fn = null) =>
    @delete "users/#{userId}/keys/#{parseInt keyId}", (data) -> fn data if fn

module.exports = (client) -> new UserKeys client
