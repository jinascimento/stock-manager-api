require 'rails_helper'

RSpec.describe ApplicationJob, type: :job do
  context 'instace' do
    it 'Instance application job' do
      instance = described_class.new
      expect(instance.class).to eq(ApplicationJob)
    end
  end

end