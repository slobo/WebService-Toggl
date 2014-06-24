package WebService::Toggl::Role::Base;

use HTTP::Tiny;

use Moo::Role;

has api_key => (is => 'ro', required => 1,);

has ua => (is => 'ro', lazy => 1, builder => 1,);
sub _build_ua {
    HTTP::Tiny->new(
        agent => 'WebService-Toggl ',  # extra space adds HTTPT version
        default_headers => { 'Content-Type' => 'application/json', },
    );
}


1;
__END__



1;
__END__
