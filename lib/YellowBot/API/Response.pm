package YellowBot::API::Response;
use Moose;
use JSON::XS qw(decode_json);
use namespace::clean;

has http => (
   is  => 'ro',
   isa => 'HTTP::Response',
   required => 1,
);

has data => (
   is   => 'ro', 
   isa  => 'HashRef',
   lazy_build => 1,
);

sub _build_data {
    my $self = shift;
    return decode_json($self->http->content);
}

1;