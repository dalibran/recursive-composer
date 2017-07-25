require 'composer'

describe '#composer' do
  it 'should return all possible sentences' do
    expect(composer('abcdefg')).to eq(['a bc def g', 'a bcd e fg', 'abcd e fg'])
  end

  it 'should return correct sentence' do
    expect(composer('abcc')).to eq(['a bc c'])
  end

  it 'should return an empty array' do
    expect(composer('abcd')).to eq([])
  end
end
