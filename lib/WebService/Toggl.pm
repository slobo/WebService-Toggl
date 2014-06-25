package WebService::Toggl;

use Moo;
with 'WebService::Toggl::Role::Base';
use namespace::clean;

our $VERSION = "0.01";


has 'me' => (is =>'ro', lazy => 1, builder => 1);
sub _build_me {
    my ($self) = @_;
    require WebService::Toggl::API::Me;
    return WebService::Toggl::API::Me->new({api_key => $self->api_key});
}


sub workspace {
    my ($self, $id) = @_;
    require WebService::Toggl::API::Workspace;
    return WebService::Toggl::API::Workspace->new({
        api_key => $self->api_key, id => $id
    });
}


1;
__END__

=encoding utf-8

=head1 NAME

WebService::Toggl - It's new $module

=head1 SYNOPSIS

    use WebService::Toggl;

=head1 DESCRIPTION

WebService::Toggl is ...

=head1 LICENSE

Copyright (C) Fitz Elliott.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Fitz Elliott E<lt>felliott@fiskur.orgE<gt>

=cut

