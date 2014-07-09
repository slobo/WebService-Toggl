package WebService::Toggl::Request;

use Data::Printer;
use HTTP::Tiny;
use MIME::Base64 qw(encode_base64);
use URI::Escape qw(uri_escape);

use Moo;
with 'Role::REST::Client';
use namespace::clean;

has api_key => (is => 'ro', required => 1,);

# extra space adds HTTPT version
has user_agent_id => (is => 'ro', default => 'WebService-Toggl ');

sub _build_user_agent {
    my ($self) = @_;
    HTTP::Tiny->new(
        agent           => $self->user_agent_id,
        default_headers => {
            'Content-Type'  => 'application/json',
            'Accept'        => 'application/json',
            'Authorization' => 'Basic ' . encode_base64($self->api_key . ':api_token', ''),
        }
    );
}


1;
__END__
