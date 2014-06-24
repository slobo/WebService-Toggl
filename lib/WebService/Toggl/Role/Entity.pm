package WebService::Toggl::Role::Entity;

use Moo::Role;
with 'WebService::Toggl::Role::Base';

has id => (is => 'ro');

has raw => (is => 'ro', lazy => 1, builder => 1);
sub _build_raw {
    my ($self) = @_;
    my $response = $self->ua->get( $self->base_url . '/' . $self->api_path );
    return $self->decoe_json( $response->{content} );
}

1;
__END__
