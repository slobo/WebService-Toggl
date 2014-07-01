package WebService::Toggl::Role::Set;

use Data::Printer;
use Sub::Quote qw(quote_sub);
use Types::Standard qw(ArrayRef);

use Moo::Role;
with 'WebService::Toggl::Role::Base',
     'WebService::Toggl::Role::Clone',
     'WebApp::Helpers::JsonEncoder';

requires 'list_of';
requires 'my_url';

has raw => (is => 'ro', lazy => 1, builder => 1);
sub _build_raw {
    my ($self) = @_;
    my $response = $self->api_get( $self->my_url );
    return $response->data->{data};
}


sub all {
    my ($self) = @_;
    my $new_class = $self->list_of;
    require $new_class;
    return map { $new_class->new({
        api_key => $self->api_key, raw => $self->clone($_),
    }) } @{$self->raw};
}


1;
__END__
