# frozen_string_literal: true

def comments_for(parent_id, comments)
  comments
    .filter { |comment| comment[:parent_id] == parent_id }
    .map do |comment|
      [comment] | comments_for(comment[:id], comments)
    end
end

describe 'comments' do
  it 'deals with no comments' do
    comments = []
    expect(comments_for(nil, comments)).to eq([])
  end

  it 'deals with a list of comments' do
    comments = [
      { id: :a, parent_id: nil },
      { id: :b, parent_id: nil },
      { id: :c, parent_id: nil }
    ]
    expect(comments_for(nil, comments)).to eq(
      [
        [{ id: :a, parent_id: nil }],
        [{ id: :b, parent_id: nil }],
        [{ id: :c, parent_id: nil }]
      ]
    )
  end

  it 'nests child comments' do
    comments = [
      { id: :a, parent_id: nil },
      { id: :b, parent_id: :a },
      { id: :c, parent_id: nil }
    ]
    expect(comments_for(nil, comments)).to eq(
      [
        [
          { id: :a, parent_id: nil },
          [
            { id: :b, parent_id: :a }
          ]
        ],
        [{ id: :c, parent_id: nil }]
      ]
    )
  end

  it 'nests child comments, many levels' do
    comments = [
      { id: :a, parent_id: nil },
      { id: :b, parent_id: :a },
      { id: :c, parent_id: :b }
    ]
    expect(comments_for(nil, comments)).to eq(
      [
        [
          { id: :a, parent_id: nil },
          [
            { id: :b, parent_id: :a },
            [
              { id: :c, parent_id: :b }
            ]
          ]
        ]
      ]
    )
  end
end
