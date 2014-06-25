package WebService::Toggl::Role::Item;

use Data::Printer;
use Types::Standard qw(Bool Int Str);
use Sub::Quote qw(quote_sub);

use Moo::Role;
with 'WebService::Toggl::Role::Base', 'WebService::Toggl::Role::JsonEncoder';

requires 'base_url';

has raw => (is => 'ro', lazy => 1, builder => 1);
sub _build_raw {
    my ($self) = @_;
    my $response = $self->ua->get( $self->_build_url($self->api_path, $self->api_id) );
    p($response);
    return $self->decode_json( $response->{content} )->{data};
}


# requires 'bools';
# requires 'strings';
# requires 'integers';

# sub BUILD {
#     my ($self) = @_;
#     warn "Dong!";
#     has $_ => (is => 'ro', isa => Bool, lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
#         for (@{ __PACKAGE__->bools });
#     has $_ => (is => 'ro', isa => Str,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
#         for (@{ __PACKAGE__->strings });
#     has $_ => (is => 'ro', isa => Int,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
#         for (@{ __PACKAGE__->integers });
# #     p($self);
# #     p($self->bools);
# #     return;
# # }


1;
__END__
