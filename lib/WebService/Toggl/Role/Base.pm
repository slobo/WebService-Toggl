package WebService::Toggl::Role::Base;

use Data::Printer;
use WebService::Toggl::Request;

use Moo::Role;

has api_key => (is => 'ro');
has server => (is => 'ro', default => 'https://www.toggl.com');

has _request => (is => 'ro', lazy => 1, builder => 1);
sub _build__request { WebService::Toggl::Request->new({
    api_key => $_[0]->api_key, server => $_[0]->server,
}) }

sub api_get    { shift->_request->get(@_)    }
sub api_post   { shift->_request->post(@_)   }
sub api_put    { shift->_request->put(@_)    }
sub api_delete { shift->_request->delete(@_) }




1;
__END__

=encoding utf-8

=head1 NAME

WebService::Toggl::Role::Base - Common behavior for all WebService::Toggl objects

=head1 DESCRIPTION

This role provide behavoir common to all C<WebService::Toggl::API::> and C<WebService::Toggl::Report::> objects.

=head1 ATTRIBUTES

=head2 api_key

The API token used to identify the authorized user.  If you don't
provide this, you'll need to supply the C<_request> attribute.

=head2 server

The base URL for the Toggl API server.  Defaults to 'https://www.toggl.com'.

=head2 _request

The object that sets the headers and makes the requests.  Defaults to
a L<WebService::Toggl::Request> object that uses L<Role::REST::Client>.


=head1 METHODS

=head2 api_get($url, $data, $args)

=head2 api_post($url, $data, $args)

=head2 api_put($url, $data, $args)

=head2 api_delete($url, $data, $args)

These are proxy methods to the C<get>, C<post>, C<put>, and C<delete>
methods available on the C<_request> object via L<Role::REST::Client>.


=head1 LICENSE

Copyright (C) Fitz Elliott.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Fitz Elliott E<lt>felliott@fiskur.orgE<gt>

=cut

