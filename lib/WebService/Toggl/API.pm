package WebService::Toggl::API;

use Module::Runtime qw(use_package_optimistically);
use Storable qw(dclone);

use Moo::Role;

has base_url => (is => 'ro', default => '/api/v8');

sub new_item {
    my ($self, $class, $args) = @_;
    use_package_optimistically('WebService::Toggl::API' . $class)
        ->new({_request => $self->_request, %$args});
}

sub new_item_from_raw {
    my ($self, $class, $raw) = @_;
    $self->new_item($class, {raw => dclone($raw)});
}

sub new_report {
    my ($self, $class, $args) = @_;
    use_package_optimistically('WebService::Toggl::Report' . $class)
        ->new({_request => $self->_request, %$args});
}

sub new_set { shift->new_item(@_) }

sub new_set_from_raw { shift->new_item_from_raw(@_) }




1;
__END__
