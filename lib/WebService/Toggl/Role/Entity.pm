package WebService::Toggl::Role::Entity;

use Data::Printer;

use Moo::Role;
with 'WebService::Toggl::Role::Base', 'WebService::Toggl::Role::JsonEncoder';

requires 'base_url';
# requires 'id';

has raw => (is => 'ro', lazy => 1, builder => 1);
sub _build_raw {
    my ($self) = @_;
    my $response = $self->ua->get( $self->_build_url($self->api_path) );
    p($response);
    return $self->decode_json( $response->{content} )->{data};
}

1;
__END__
