package WebService::Toggl::Role::Base;

use Data::Printer;
use HTTP::Tiny;
use MIME::Base64 qw(encode_base64);
use URI::Escape qw(uri_escape);

use Moo::Role;

has api_key => (is => 'ro', required => 1,);

# extra space adds HTTPT version
has user_agent => (is => 'ro', default => 'WebService-Toggl ');

has ua => (is => 'ro', lazy => 1, builder => 1,);
sub _build_ua {
    my ($self) = @_;
    HTTP::Tiny->new(
        agent           => $self->user_agent,
        default_headers => {
            'Content-Type'  => 'application/json',
            'Authorization' => 'Basic ' . encode_base64($self->api_key . ':api_token'),
        }
    );
}


sub _build_url {
    my ($self, $path_parts, $params) = @_;
    my $base = join('/', $self->base_url, @$path_parts);
    $base =~ s{/$}{};
    my $req = join('&', map {$_ . '=' . uri_escape($params->{$_})} keys %{$params || {}});
    return $base . '?' . $req;
}



1;
__END__
