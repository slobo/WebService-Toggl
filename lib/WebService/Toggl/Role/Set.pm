package WebService::Toggl::Role::Set;

use Moo::Role;
with 'WebService::Toggl::Role::Base';

requires 'list_of';
requires 'my_url';

has raw => (is => 'ro', lazy => 1, builder => 1);
sub _build_raw {
    my ($self) = @_;
    my $response = $self->api_get( $self->my_url );
    return $response->data;
}


sub all {
    my ($self) = @_;
    my $new_class = $self->list_of;
    return map { $self->new_item_from_raw($new_class, $_) } @{$self->raw};
}


1;
__END__
