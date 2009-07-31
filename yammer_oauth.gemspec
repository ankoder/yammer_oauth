# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{yammer_oauth}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Isaiah Peng"]
  s.date = %q{2009-07-31}
  s.description = %q{OAuth for yammer, adopted from twitter_oauth}
  s.email = %q{isaiah.peng@rorcraft.com}
  s.extra_rdoc_files = ["README.rdoc", "lib/yammer_oauth.rb"]
  s.files = ["Rakefile", "README.rdoc", "lib/yammer_oauth.rb", "Manifest", "yammer_oauth.gemspec"]
  s.homepage = %q{http://github.com/isaiah/yammer_oauth.git}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Yammer_oauth", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{yammer_oauth}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{OAuth for yammer, adopted from twitter_oauth}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<oauth>, [">= 0"])
    else
      s.add_dependency(%q<oauth>, [">= 0"])
    end
  else
    s.add_dependency(%q<oauth>, [">= 0"])
  end
end
