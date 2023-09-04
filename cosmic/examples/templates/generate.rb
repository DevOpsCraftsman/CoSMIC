require "erb"

examples_folder = 'cosmic/examples'

erb_file = "#{examples_folder}/templates/abstraction/abstraction.md.erb"

erb_str = File.read(erb_file)

@specs = [
  {language: "typescript", extension: "ts"},
  {language: "python", extension: "py"},
]

@specs.each do |spec|
  @spec = spec
  @samples = []
  output_file = "#{examples_folder}/#{spec[:language]}/abstraction/abstraction.md"
  sample_files = Dir["#{examples_folder}/templates/abstraction/abstraction_sample_*.#{spec[:extension]}"]
  puts sample_files
  sample_files.each do |sample_file|
    File.open(sample_file) do |sample|
      @samples.push sample.read
    end
  end
  renderer = ERB.new(erb_str)
  result = renderer.result()

  File.open(output_file, 'w') do |output|
    output.write(result)
  end
end

