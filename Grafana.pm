#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

use LWP::UserAgent;
use HTTP::Request;
use JSON;
use URI::Escape;

my $api_key = "api_key";

sub new {
#    my($args) = @_;
    my $auth = "Authorization: Bearer " . $api_key;
    my $self = {
        #hostname => $args->{hostname},
        hostname => 'grafana-test.it.su.se',
        auth     => $auth,
    };
    $self->{url} = "https://$self->{hostname}";
    $self->{ua} = LWP::UserAgent->new;

    #bless $self;
    return $self;
}

my $info = new();

print Dumper $info;

