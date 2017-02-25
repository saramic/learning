shared_examples_for 'input output solver' do |solver, input, output|
  it "code #{input.inspect} == #{output}" do
    expect(send(solver, input)).to eql(output)
  end
end

