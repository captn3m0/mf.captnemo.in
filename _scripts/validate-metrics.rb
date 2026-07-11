#!/usr/bin/env ruby
# frozen_string_literal: true
#
# Validate a Prometheus text-exposition metrics file.
# Usage: ruby _scripts/validate-metrics.rb [path]   (default: _site/metrics)
# Exits non-zero (with messages on stderr) on any problem, so CI can gate on it.
#
# Checks: file is non-empty, starts with a comment, every sample line matches the
# Prometheus grammar, every metric family has HELP + TYPE before its samples, and
# there are no duplicate series (identical name+labels).

path = ARGV[0] || "_site/metrics"

unless File.exist?(path) && File.size(path).positive?
  abort "FAIL: metrics file missing or empty: #{path}"
end

text = File.read(path)
abort "FAIL: metrics must start with a '#' comment (# HELP ...)" unless text.start_with?("#")

# name{label="value",...} <number>   — labels optional, value may be int/float/exp/Inf/NaN
SAMPLE = /\A
  [a-zA-Z_:][a-zA-Z0-9_:]*                                   # metric name
  (\{ [a-zA-Z_][a-zA-Z0-9_]* = "([^"\\]|\\.)*"               # first label
      (,\s* [a-zA-Z_][a-zA-Z0-9_]* = "([^"\\]|\\.)*" )* \})? # more labels
  \s+ (-?(\d+(\.\d+)?([eE][+-]?\d+)?)|[+-]?Inf|NaN)          # value
\z/x

help = {}
type = {}
seen = Hash.new(0)
errors = []

text.each_line.with_index(1) do |raw, i|
  line = raw.chomp
  next if line.empty?

  if (m = line.match(/\A# (HELP|TYPE) (\S+)/))
    (m[1] == "HELP" ? help : type)[m[2]] = true
    next
  end
  next if line.start_with?("#")

  errors << "line #{i}: malformed sample: #{line}" unless line.match?(SAMPLE)

  name = line[/\A[a-zA-Z_:][a-zA-Z0-9_:]*/]
  errors << "line #{i}: sample for '#{name}' before its # HELP/# TYPE" unless help[name] && type[name]

  series = line.sub(/\s+\S+\z/, "") # strip trailing value; label values carry no spaces here
  seen[series] += 1
end

seen.select { |_s, count| count > 1 }.each { |s, count| errors << "duplicate series (#{count}x): #{s}" }

if errors.empty?
  puts "OK: #{path} — #{seen.size} series across #{type.size} metric families"
else
  errors.first(25).each { |e| warn e }
  abort "FAIL: metrics validation found #{errors.size} problem(s) in #{path}"
end
