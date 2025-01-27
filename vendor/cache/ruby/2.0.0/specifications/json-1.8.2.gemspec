# -*- encoding: utf-8 -*-
# stub: json 1.8.2 ruby lib
# stub: ext/json/ext/generator/extconf.rb ext/json/ext/parser/extconf.rb ext/json/extconf.rb

Gem::Specification.new do |s|
  s.name = "json"
  s.version = "1.8.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Florian Frank"]
  s.date = "2015-01-09"
  s.description = "This is a JSON implementation as a Ruby extension in C."
  s.email = "flori@ping.de"
  s.extensions = ["ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb", "ext/json/extconf.rb"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["README.rdoc", "ext/json/ext/generator/extconf.rb", "ext/json/ext/parser/extconf.rb", "ext/json/extconf.rb"]
  s.homepage = "http://flori.github.com/json"
  s.licenses = ["Ruby"]
  s.rdoc_options = ["--title", "JSON implemention for Ruby", "--main", "README.rdoc"]
  s.rubygems_version = "2.5.0"
  s.summary = "JSON Implementation for Ruby"

  s.installed_by_version = "2.5.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<permutation>, [">= 0"])
      s.add_development_dependency(%q<sdoc>, ["~> 0.3.16"])
    else
      s.add_dependency(%q<permutation>, [">= 0"])
      s.add_dependency(%q<sdoc>, ["~> 0.3.16"])
    end
  else
    s.add_dependency(%q<permutation>, [">= 0"])
    s.add_dependency(%q<sdoc>, ["~> 0.3.16"])
  end
end
