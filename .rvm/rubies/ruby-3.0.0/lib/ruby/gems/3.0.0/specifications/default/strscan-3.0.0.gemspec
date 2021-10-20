# -*- encoding: utf-8 -*-
# stub: strscan 3.0.0 ruby lib
# stub: ext/strscan/extconf.rb

Gem::Specification.new do |s|
  s.name = "strscan".freeze
  s.version = "3.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Minero Aoki".freeze, "Sutou Kouhei".freeze]
  s.date = "2021-09-17"
  s.description = "Provides lexical scanning operations on a String.".freeze
  s.email = [nil, "kou@cozmixng.org".freeze]
  s.extensions = ["ext/strscan/extconf.rb".freeze]
  s.files = ["ext/strscan/extconf.rb".freeze, "strscan.bundle".freeze]
  s.homepage = "https://github.com/ruby/strscan".freeze
  s.licenses = ["Ruby".freeze, "BSD-2-Clause".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.2.3".freeze
  s.summary = "Provides lexical scanning operations on a String.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rake-compiler>.freeze, [">= 0"])
    s.add_development_dependency(%q<benchmark-driver>.freeze, [">= 0"])
    s.add_development_dependency(%q<test-unit>.freeze, [">= 0"])
  else
    s.add_dependency(%q<rake-compiler>.freeze, [">= 0"])
    s.add_dependency(%q<benchmark-driver>.freeze, [">= 0"])
    s.add_dependency(%q<test-unit>.freeze, [">= 0"])
  end
end
