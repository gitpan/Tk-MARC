use Test::More tests => 7;

use Tk;
use strict;

use_ok( 'Tk::MARC::Indicators' );
is( $Tk::MARC::Indicators::VERSION,'0.3', 'Ok' );

my $mw = Tk::MainWindow->new();
$mw->geometry('+10+10');

my $i0 = $mw->MARC_Indicators(-field => '245',
                             -ind1 => '0',
                             -ind2 => '7');
ok(Tk::Exists($i0, 1));
ok($i0->class, 'MARC_Indicators');
ok(ref $i0, "Tk::MARC::Indicators");

my $ind1 = $i0->get(1);
ok($ind1 == 0, 'Returns correct indicator 1 value');
my $ind2 = $i0->get(2);
ok($ind2 == 7, 'Returns correct indicator 2 value');
