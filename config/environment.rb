# Load the Rails application.
require_relative 'application'

Amazon::Ecs.options = {
      associate_tag:     'ixykazuki-22',
      AWS_access_key_id: 'AKIAIRRKYNOLDNOZL3BQ',
      AWS_secret_key:   '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'
}

# Initialize the Rails application.
Rails.application.initialize!
