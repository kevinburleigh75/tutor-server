require 'rails_helper'

RSpec.describe Topic, :type => :model do
  it { is_expected.to belong_to(:klass) }
  it { is_expected.to have_many(:exercise_definition_topics).dependent(:destroy) }
  it { is_expected.to have_many(:exercise_definitions).through(:exercise_definition_topics) }
  
  it { is_expected.to validate_presence_of(:klass) }
end
