require 'validate'

describe '#validate' do
  it 'should remove bad sentences from array' do
    expect(validate(['a bc', 'a bc c'])).to eq(['a bc c'])
  end
end

describe '#validate_structure' do
  it 'should return true for valid sentences' do
    expect(validate_sentence(0, 1, 1, 1)).to eq(true)
  end

  it 'should return false for invalid sentences' do
    expect(validate_sentence(1, 1, 1, 1)).to eq(false)
  end
end
