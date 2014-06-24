package WebService::Toggl::Base;

use HTTP::Tiny;

use Moo::Role;


has ua => (is => 'ro', lazy => 1, buidler => 1,);
sub _build_ua {
    HTTP::Tiny->new(
        agent => 'WebService-Toggl ',  # extra space adds HTTPT version
        default_headers => {
            'Content-Type' => 'application/json',
        }
    );
}
has base_url => ();


has api_key => (is => 'ro');


1;
__END__



1;
__END__
