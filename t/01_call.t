use strict;
use Test::More 0.98;

use Filter::FatArrowWithScalar;

sub is_list_context { wantarray ? 1 : 0 }
my $is_list_context = \&is_list_context;

my $self = bless {};
subtest 'fat arrow' => sub {
    is +{ is_list_context =>              is_list_context()  }->{is_list_context}, 0, 'func call.';
    is +{ is_list_context =>           $is_list_context->()  }->{is_list_context}, 0, 'funcref call.';
    is +{ is_list_context => __PACKAGE__->is_list_context()  }->{is_list_context}, 0, 'class method call.';
    is +{ is_list_context =>       $self->is_list_context()  }->{is_list_context}, 0, 'instance method call.';
    is +{ is_list_context =>             (is_list_context()) }->{is_list_context}, 1, 'pure list.';
};

subtest 'not fat arrow' => sub {
    is +{ 'is_list_context',              is_list_context()  }->{is_list_context}, 1, 'func call.';
    is +{ 'is_list_context',           $is_list_context->()  }->{is_list_context}, 1, 'funcref call.';
    is +{ 'is_list_context', __PACKAGE__->is_list_context()  }->{is_list_context}, 1, 'class method call.';
    is +{ 'is_list_context',       $self->is_list_context()  }->{is_list_context}, 1, 'instance method call.';
    is +{ 'is_list_context',             (is_list_context()) }->{is_list_context}, 1, 'pure list.';
};

done_testing;

