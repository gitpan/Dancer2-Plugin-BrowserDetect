
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Provides an easy to have info of the browser.",
  "AUTHOR" => "Natal Ng\303\251tal",
  "BUILD_REQUIRES" => {
    "Dancer2::Test" => 0,
    "Data::Dumper" => 0,
    "Module::Build" => "0.3601",
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30",
    "Module::Build" => "0.3601"
  },
  "DISTNAME" => "Dancer2-Plugin-BrowserDetect",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dancer2::Plugin::BrowserDetect",
  "PREREQ_PM" => {
    "Dancer" => "1.2001",
    "Dancer2" => 0,
    "Dancer2::Plugin" => 0,
    "HTTP::BrowserDetect" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "1.131620",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



