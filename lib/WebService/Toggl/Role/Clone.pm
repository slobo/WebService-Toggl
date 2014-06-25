package WebService::Toggl::Role::Clone;

use Storable qw(dclone);

use Moo::Role;

sub clone { dclone($_[1]) }

1;
__END__
