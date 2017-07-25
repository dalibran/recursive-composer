require 'build'

describe '#build' do
  it 'should return a string' do
    expect(build(1, 1, 'a', 'bcd', 'a')).to be_an_instance_of(String)
  end
end
