# frozen_string_literal: true

# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    content = tsv.split("\n")
    keys = content[0].split("\t")
    content.shift
    @data = content.map do |line|
      values = line.split("\t")
      data = {}
      keys.each_index { |index| data[keys[index]] = values[index] }
      data
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    keys = @data[0].keys
    lines = ''
    keys.each { |key| lines += key == keys.last ? "#{key}\n" : "#{key}\t" }
    @data.each do |line|
      line.each { |key, value| lines += key == keys.last ? "#{value}\n" : "#{value}\t" }
    end
    lines
  end
end
