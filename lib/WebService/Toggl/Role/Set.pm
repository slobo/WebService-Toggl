package WebService::Toggl::Role::Set;

use Data::Printer;
use Sub::Quote qw(quote_sub);
use Types::Standard qw(ArrayRef);

use Moo::Role;
with 'WebService::Toggl::Role::Base', 'WebApp::Helpers::JsonEncoder';

requires 'list_of';

has raw => (is => 'ro', lazy => 1, builder => 1);
install '_build_raw' => sub {
    my ($self) = @_;
    my $response = $self->ua->get( $self->_build_url([
        $self->previous_bits, $self->api_path,
    ]) );
    return $self->decode_json( $response->{content} )->{data};
};


sub all {
    my ($self) = @_;
    my $new_class = $self->list_of;
    require $new_class;
    return map { $new_class->new({api_key => $self->api_key, raw => $_}) }
        @{$self->raw};
}


1;
__END__
