package WebService::Toggl::Role::Base;

use HTTP::Tiny;
use MIME::Base64 qw(encode_base64);

use Moo::Role;

has api_key => (is => 'ro', required => 1,);

has ua => (is => 'ro', lazy => 1, builder => 1,);
sub _build_ua {
    my ($self) = @_;
    HTTP::Tiny->new(
        agent => 'WebService-Toggl ',  # extra space adds HTTPT version
        default_headers => {
            'Content-Type'  => 'application/json',
            'Authorization' => 'Basic ' . encode_base64($self->api_key . ':api_token'),
        }
    );
}


sub _build_url {
    my ($self, @path) = @_;
    return join('/', ($self->base_url, grep {$_} @path));
}



1;
__END__
