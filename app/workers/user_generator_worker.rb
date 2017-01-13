class UserGeneratorWorker
  include Sidekiq::Worker

  def perform(user_id, name, address)
    puts "worker creating user with id: #{user_id}"

    User.create(id: user_id, name: name, address: address)
  end
end
