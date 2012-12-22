# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ronn"
  s.version = "0.7.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Ryan Tomayko"]
  s.date = "2010-06-24"
  s.description = "Builds manuals"
  s.email = "rtomayko@gmail.com"
  s.executables = ["ronn"]
  s.extra_rdoc_files = ["COPYING", "AUTHORS"]
  s.files = ["bin/ronn", "COPYING", "AUTHORS"]
  s.homepage = "http://rtomayko.github.com/ronn"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Ronn"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Builds manuals"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<hpricot>, [">= 0.8.2"])
      s.add_runtime_dependency(%q<rdiscount>, [">= 1.5.8"])
      s.add_runtime_dependency(%q<mustache>, [">= 0.7.0"])
    else
      s.add_dependency(%q<hpricot>, [">= 0.8.2"])
      s.add_dependency(%q<rdiscount>, [">= 1.5.8"])
      s.add_dependency(%q<mustache>, [">= 0.7.0"])
    end
  else
    s.add_dependency(%q<hpricot>, [">= 0.8.2"])
    s.add_dependency(%q<rdiscount>, [">= 1.5.8"])
    s.add_dependency(%q<mustache>, [">= 0.7.0"])
  end
end
