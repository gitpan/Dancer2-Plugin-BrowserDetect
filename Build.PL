
use strict;
use warnings;

use Module::Build 0.3601;


my %module_build_args = (
  "build_requires" => {
    "Dancer2::Test" => 0,
    "Data::Dumper" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => 0
  },
  "configure_requires" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "dist_abstract" => "Provides an easy to have info of the browser.",
  "dist_author" => [
    "Natal Ng\303\251tal"
  ],
  "dist_name" => "Dancer2-Plugin-BrowserDetect",
  "dist_version" => "1.131620",
  "license" => "perl",
  "module_name" => "Dancer2::Plugin::BrowserDetect",
  "recommends" => {},
  "recursive_test_files" => 1,
  "requires" => {
    "Dancer" => "1.2001",
    "Dancer2" => 0,
    "Dancer2::Plugin" => 0,
    "HTTP::BrowserDetect" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "script_files" => []
);


my $build = Module::Build->new(%module_build_args);

$build->create_build_script;
