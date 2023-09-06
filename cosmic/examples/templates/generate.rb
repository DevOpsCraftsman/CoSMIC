require "erb"

examples_folder = 'cosmic/examples'

erb_file = "#{examples_folder}/templates/abstraction/template.md.erb"

erb_str = File.read(erb_file)

@specs = [
  {language: "typescript", extension: "ts"},
  {language: "python", extension: "py"},
]

concepts = [
  :abstraction,
]

code_template = "
```%{language}
%{sample}
```
".strip

@specs.each do |spec|
  @spec = spec
  @samples = []
  concepts.each do |concept|
    
    ext = spec[:extension]
    lang = spec[:language]

    samples_folder = "#{examples_folder}/templates/#{concept}/#{lang}/*.#{ext}"
    samples_files = Dir[samples_folder]

    samples_files.each do |sample_file|
      File.open(sample_file) do |file|
        content = file.read
        sample = code_template % {language: lang, sample: content.strip}
        @samples.push sample
      end
    end

    renderer = ERB.new(erb_str)
    result = renderer.result()

    output_file = "#{examples_folder}/#{spec[:language]}/#{concept}.md"

    File.open(output_file, 'w') do |output|
      output.write(result)
    end

  end
end

