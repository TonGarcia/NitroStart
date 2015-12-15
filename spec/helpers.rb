module Helpers
  # Just for Controller tests
  def perform_and_validate_request(method, action, params)
    # Perform it
    send(method, action, params)

    # Test Success request & response
    expect(response).to be_success
    hash_resp = JSON.parse(response.body).it_keys_to_sym!
    expect(hash_resp).to_not be_nil

    # return it hash mapped
    hash_resp
  end
end