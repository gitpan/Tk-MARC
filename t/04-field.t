use Test::More tests => 8;

use Tk;
use strict;

use_ok( 'Tk::MARC::Field' );
is( $Tk::MARC::Field::VERSION,'0.10', 'Ok' );

# Build a MARC field
my $field = MARC::Field->new('100','','','a' => 'Christensen, David A.');

my $mw = Tk::MainWindow->new();
$mw->geometry('+10+10');

my $f0 = $mw->MARC_Field(-field => $field);
ok(Tk::Exists($f0, 1));
ok($f0->class, 'MARC_Field');
ok(ref $f0, "Tk::MARC::Field");

my $field2 = $f0->get();
ok(ref $field2, "MARC::Field");

ok( $field != $field2, 'Correctly does not return reference to original' );
ok( $field->as_formatted eq $field2->as_formatted, 'Returned and original match content' );

