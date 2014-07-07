package WebService::Toggl;

use Module::Runtime qw(use_package_optimistically);

use Moo;
with 'WebService::Toggl::Role::Base';
use namespace::clean;

our $VERSION = "0.01";


has 'me' => (is =>'ro', lazy => 1, builder => 1);
sub _build_me { shift->_new_thing('::API::Me') }


sub workspace     { shift->_new_thing_by_id('::API::Workspace',     @_) }
sub client        { shift->_new_thing_by_id('::API::Client',        @_) }
sub project       { shift->_new_thing_by_id('::API::Project',       @_) }
sub project_user  { shift->_new_thing_by_id('::API::ProjectUser',   @_) }
sub tag           { shift->_new_thing_by_id('::API::Tag',           @_) }
sub task          { shift->_new_thing_by_id('::API::Task',          @_) }
sub time_entry    { shift->_new_thing_by_id('::API::TimeEntry',     @_) }
sub user          { shift->_new_thing_by_id('::API::User',          @_) }
sub WorkspaceUser { shift->_new_thing_by_id('::API::WorkspaceUser', @_) }


sub details { shift->_new_thing('::Report::Details', @_) }
sub summary { shift->_new_thing('::Report::Summary', @_) }
sub weekly  { shift->_new_thing('::Report::Weekly',  @_) }


sub _new_thing {
    my ($self, $class, $args) = @_;
    return use_package_optimistically('WebService::Toggl' . $class)
        ->new({_request => $self->_request, %{$args || {}}});
}

sub _new_thing_by_id { shift->_new_thing(shift, {id => shift}) }

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

