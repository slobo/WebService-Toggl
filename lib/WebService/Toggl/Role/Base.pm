package WebService::Toggl::Role::Base;

use Data::Printer;
use WebService::Toggl::Request;

use Moo::Role;

has api_key => (is => 'ro', required => 1,);
has server => (is => 'ro', default => 'https://www.toggl.com');

has _request => (is => 'ro', lazy => 1, builder => 1);
sub _build__request { WebService::Toggl::Request->new({
    api_key => $_[0]->api_key, server => $_[0]->server,
}) }

sub api_get    { shift->_request->get(@_)    }
sub api_post   { shift->_request->post(@_)   }
sub api_put    { shift->_request->put(@_)    }
sub api_delete { shift->_request->delete(@_) }




1;
__END__
