class Grid
  def self.[](column_count, row_count)
    new(row_count: row_count, column_count: column_count)
  end

  def self.from_rows(rows)
    row_sizes = rows.map(&:size).uniq
    raise ArgumentError, "non-uniform rows" if row_sizes.size != 1

    new(
      row_count: rows.size,
      column_count: row_sizes.first,
      rows: rows,
    )
  end

  attr_reader :column_count, :row_count, :rows

  def initialize(row_count:, column_count:, rows: nil, &default_block)
    @row_count = row_count
    @column_count = column_count
    @rows = rows || Array.new(row_count) do
      Array.new(column_count) do
        default_block ? default_block.call : default_value
      end
    end

    if rows && rows.any? { _1.size != column_count }
      raise ArgumentError, "some rows do not have #{column_count} columns"
    end
  end

  def default_value
    nil
  end

  def cells
    rows.flatten(1)
  end

  def each_cell
    return enum_for(__method__) unless block_given?

    rows.each_with_index do |row, row_idx|
      row.each_with_index do |cell, col_idx|
        yield cell, col_idx, row_idx
      end
    end
  end

  def out_of_bounds?(x, y)
    return true if x < 0
    return true if x >= column_count
    return true if y < 0
    return true if y >= row_count
    false
  end

  def each_neighbour_of(x, y, diagonals: true)
    return enum_for(__method__) unless block_given?

    [
      ([x - 1, y - 1] if diagonals),
      [x - 1, y - 0],
      ([x - 1, y + 1] if diagonals),

      [x - 0, y - 1],
      [x - 0, y + 1],

      ([x + 1, y - 1] if diagonals),
      [x + 1, y - 0],
      ([x + 1, y + 1] if diagonals),
    ].compact.reject { out_of_bounds?(*_1) }.each do |(nx, ny)|
      yield self[nx, ny], x, y
    end
  end

  def columns
    Array.new(column_count) do |col_idx|
      rows.map { _1[col_idx] }
    end
  end

  def transpose
    dup.tap(&:transpose!)
  end

  def transpose!
    @rows = rows.transpose
    @row_count, @column_count = @column_count, @row_count
  end

  def dup
    row_dup = Marshal.load(Marshal.dump(@rows))
    self.class.from_rows(row_dup)
  end

  def []=(col_idx, row_idx, value)
    check_coord(col_idx, row_idx)
    rows[row_idx][col_idx] = value
  end

  def [](col_idx, row_idx)
    rows[row_idx][col_idx]
  end

  private

    def check_coord(col_idx, row_idx)
      if col_idx < 0 || col_idx >= column_count
        raise ArgumentError "column out of bounds: #{col_idx.inspect}"
      end

      if row_idx < 0 || row_idx >= row_count
        raise ArgumentError "row out of bounds: #{row_idx.inspect}"
      end
    end
end
