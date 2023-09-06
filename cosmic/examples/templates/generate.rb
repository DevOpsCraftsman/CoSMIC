require "erb"

examples_folder = 'cosmic/examples'

@specs = [
  {language: "typescript", extension: "ts"},
  {language: "python", extension: "py"},
]

concepts = [
  :abstraction,
  :cohesion,
]

code_template = "
```%{language}
%{sample}
```
".strip


@specs.each do |spec|

  concepts.each do |concept|
    
    ext = spec[:extension]
    lang = spec[:language]

    samples_folder = "#{examples_folder}/templates/#{concept}/#{lang}/*.#{ext}"
    samples_files = Dir[samples_folder]

    @samples = []

    samples_files.each do |sample_file|
      File.open(sample_file) do |file|
        content = file.read
        sample = code_template % {language: lang, sample: content.strip}
        @samples.push sample
      end
    end

    template_file = "#{examples_folder}/templates/#{concept}/template.md.erb"
    template = File.read(template_file)

    renderer = ERB.new(template)
    result = renderer.result()

    output_file = "#{examples_folder}/#{lang}/#{concept}.md"

    File.open(output_file, 'w') do |output|
      output.write(result)
    end

  end
end

