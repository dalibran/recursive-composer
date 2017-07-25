require 'generate_paths'

describe '#generate_paths' do
  it 'should return an array' do
    expect(generate_paths(DICT, 'abcc')).to be_an_instance_of(Array)
  end
end
