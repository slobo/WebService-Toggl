package WebService::Toggl::Role::Item;

use Package::Variant
    importing => ['Moo::Role'],
    subs      => [qw(has with)];

use Data::Printer;
use Sub::Quote qw(quote_sub);
use Types::Standard qw(Bool Int Str);

sub make_variant {
    my ($class, $target_pkg, %arguments) = @_;

    with 'WebService::Toggl::Role::Base', 'WebApp::Helpers::JsonEncoder';

    install 'my_url' => sub {
        my $url = $_[0]->base_url . '/' . $_[0]->api_path . '/' . $_[0]->api_id;
        $url =~ s{/$}{};
        return $url;
    };

    has raw => (is => 'ro', lazy => 1, builder => 1);
    install '_build_raw' => sub {
        my ($self) = @_;
        my $response = $self->api_get( $self->my_url );
        return $response->data->{data};
    };

    has $_ => (is => 'ro', isa => Bool, lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
        for (@{ $arguments{bools} } );
    has $_ => (is => 'ro', isa => Str,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
        for (@{ $arguments{strings} } );
    has $_ => (is => 'ro', isa => Int,  lazy => 1, builder => quote_sub(qq| \$_[0]->raw->{$_} |))
        for (@{ $arguments{integers} });

    install 'update' => sub {
        my ($self) = @_;
        $self->api_put($self->my_url, $self->raw);
    };

    install 'delete' => sub {
        my ($self) = @_;
        $self->api_delete($self->my_url);
    };

}


1;
__END__
