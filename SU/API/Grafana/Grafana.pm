package SU::API::Grafana;

use strict;
use warnings;

use Data::Dumper;

use LWP::UserAgent;
use HTTP::Request;
use JSON;
use URI::Escape;


sub new {
    my($class, $args) = @_;
    my $auth = "Authorization: Bearer " . $args->{api_key};
    my $self = {
        hostname => $args->{hostname},
        auth     => $auth,
    };
    $self->{url} = "https://$self->{hostname}";
    $self->{ua} = LWP::UserAgent->new;

    bless $selfi, $class;
    return $self;
}

1;
