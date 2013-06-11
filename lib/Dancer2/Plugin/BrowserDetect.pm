#
# This file is part of Dancer2-Plugin-BrowserDetect
#
# This software is copyright (c) 2013 by Natal Ngétal.
#
# This is free software; you can redistribute it and/or modify it under
# the same terms as the Perl 5 programming language system itself.
#
package Dancer2::Plugin::BrowserDetect;
{
  $Dancer2::Plugin::BrowserDetect::VERSION = '1.131620';
}

use strict;
use warnings;

use Dancer2 ':syntax';
use Dancer2::Plugin;

use HTTP::BrowserDetect;

#ABSTRACT: Provides an easy to have info of the browser.


hook before_template => sub {
    my $tokens = shift;

    $tokens->{browser_detect} = _browser_detect();
};

register browser_detect => sub {
    _browser_detect();
};

sub _browser_detect {
    my $useragent = request->env->{HTTP_USER_AGENT};
    my $browser   = HTTP::BrowserDetect->new($useragent);

    return $browser;
}

register_plugin for_versions => [2];


1;

__END__

=pod

=head1 NAME

Dancer2::Plugin::BrowserDetect - Provides an easy to have info of the browser.

=head1 VERSION

version 1.131620

=head1 SYNOPSIS

    use Dancer2;
    use Dancer2::Plugin::BrowserDetect;

    get '/' => sub {
        my $browser = browser_detect();

        if ( $browser->windows && $browser->ie && $browser->major() < 6 ) {
            return "You have big failed, change your os, browser, and come back late.";
        }
    };

    dance;

=head1 DESCRIPTION

Provides an easy to have info of the browser.
keyword within your L<Dancer> application.

=head1 METHODS

=head2 browser_detect

    browser_detect()
or
    <% browser_detect %>

To have info of the browser

    input: none
    output: A HTTP::BrowserDetect object

=encoding utf8

=head1 CONTRIBUTING

This module is developed on Github at:

L<http://github.com/hobbestigrou/Dancer2-Plugin-BrowserDetect>

Feel free to fork the repo and submit pull requests

=head1 BUGS

Please report any bugs or feature requests in github.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Dancer2::Plugin::BrowserDetect

=head1 SEE ALSO

L<Dancer>
L<HTTP::BrowserDetect>
L<Catalyst::TraitFor::Request::BrowserDetect>
L<Mojolicious::Plugin::BrowserDetect>
L<Dancer::Plugin::Browser>

=head1 AUTHOR

Natal Ngétal

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2013 by Natal Ngétal.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
