# Load the Rails application.
require_relative 'application'

Amazon::Ecs.options = {
      associate_tag:     'ixykazuki-22',
      AWS_access_key_id: 'AKIAIUAQBU6AHQOSE76Q',
      AWS_secret_key:   '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'
}

# Initialize the Rails application.
Rails.application.initialize!
