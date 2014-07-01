package WebService::Toggl::API::WorkspaceUser;

use WebService::Toggl::Role::Item as => 'JsonItem';

use Moo;
with 'WebService::Toggl::API';
use namespace::clean;

with JsonItem(
    bools    => [ qw( admin active) ],
    strings  => [ qw( email at name invite_url ) ],
    integers => [ qw( id uid wid ) ]
);

sub api_path { 'workspace_users' }
sub api_id   { shift->id }

sub set_admin {
    my ($self, $is_admin) = @_;
    $self->api_put( $self->my_url, {admin => $is_admin} );
}
sub make_admin   { $_[0]->set_admin(!!1) }
sub revoke_admin { $_[0]->set_admin(!!0) }

sub delete { $_[0]->api_delete( $_[0]->my_url ) }

1;
__END__
    {
        "id":3123855,
        "uid":35224123,
        "wid":777,
        "admin":false,
        "active":false,
        "email":"John@toggl.com",
        "at":"2013-05-17T16:50:36+03:00",
        "name":"John Swift",
        "invite_url":"https://toggl.com/user/accept_invitation?code=fb3ad3db5dasd123c2b529e3a519826"
    },
