require 'init_sentences'

describe '#init_sentences' do
  it 'should return an array' do
    expect(init_sentences('abcc')).to be_an_instance_of(Array)
  end
end
