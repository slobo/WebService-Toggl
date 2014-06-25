package WebService::Toggl::Role::Item;

use Package::Variant
    importing => ['Moo::Role'],
    subs      => [qw(has with)];

use Data::Printer;
use Sub::Quote qw(quote_sub);
use Types::Standard qw(Bool Int Str);

sub make_variant {
    my ($class, $target_pkg, %arguments) = @_;

    with 'WebService::Toggl::Role::Base', 'WebService::Toggl::Role::JsonEncoder';

    has raw => (is => 'ro', lazy => 1, builder => 1);
    install '_build_raw' => sub {
        my ($self) = @_;
        my $response = $self->ua->get( $self->_build_url($self->api_path, $self->api_id) );
        return $self->decode_json( $response->{content} )->{data};
    };

    has $_ => (is => 'ro', isa => Bool, lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
        for (@{ $arguments{bools} } );
    has $_ => (is => 'ro', isa => Str,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
        for (@{ $arguments{strings} } );
    has $_ => (is => 'ro', isa => Int,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
        for (@{ $arguments{integers} });
}


1;
__END__
