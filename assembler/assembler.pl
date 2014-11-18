#!/usr/bin/perl

use strict;

my $definition_data = <<END_OF_DEFINITION;
0000rrRR	MOV rr RR
0001rrRR	OR rr RR
0010rrRR	AND rr RR
0011rrRR	XOR rr RR
0100rrRR	ADD rr RR
0101rrRR	SUB rr RR
011000RR	INV RR
011001RR	SHR RR
011010RR	INC RR
011011RR	DEC RR
011100RR	IN0 RR
011101RR	IN1 RR
011110RR	OUT0 RR
011111RR	OUT1 RR
10DDDDRR	MOVC DDDD RR
11AAAAAA	JMP AAAAAA
11AAAAAA	JF AAAAAA
00000000	NOP
00010000	FLAGON
END_OF_DEFINITION

my %definition = ();

my %labels = ();
my @input = ();

my @definition_array = split(/[\r\n]+/, $definition_data);
for (my $i = 0; $i < @definition_array; $i++) {
	my $line = $definition_array[$i];
	my ($ins, $asm) = split(/\t/, $line);
	if ($ins ne "" && $asm ne "") {
		my ($asm0, @a) = split(/ /, $asm);
		$definition{$asm0} = $line;
	}
}

# 一度入力を読み、ラベルを登録する
my $counter = 0;
while (my $line = <STDIN>) {
	chomp($line);
	my @dummy;
	# 行頭の空白を切る
	$line =~ s/^[ \t]+//;
	# コメントを切る (今回は文字列は扱わない)
	($line, @dummy) = split(/;/, $line);
	($line, @dummy) = split(/\/\//, $line);
	($line, @dummy) = split(/#/, $line);
	($line, @dummy) = split(/'/, $line);
	# ラベルを登録する
	if (index($line, ":") >= 0) {
		my $label = "";
		$line =~ s/^(.*?):[ \t]*/$label=$1,""/e;
		$labels{$label} = $counter;
	}
	if ($line eq "") {next;}
	# 位置と命令を登録する
	$line =~ s/\t/ /g;
	my $raw_line = $line;
	$line =~ s/,/ /g;
	$line =~ s/ +/ /g;
	push(@input, "$counter\t$line\t$raw_line");
	# 命令の位置を進める
	$counter++;
}

# ヘッダ
print "module MEMORY(ADDR, DATA);\n";
print "\tinput  [5:0] ADDR;\n";
print "\toutput [7:0] DATA;\n";
print "\n";
print "\twire   [7:0] DATA;\n";
print "\n";
print "\tassign DATA =\n";

# 命令を出力する
for (my $i = 0; $i < @input; $i++) {
	my ($addr, $order, $raw_line) = split(/\t/, $input[$i]);
	my @order_set = split(/ /, $order);
	unless (defined($definition{$order_set[0]})) {
		die "order $order_set[0] undefined\n";
	}
	my $order = $definition{$order_set[0]};
	my ($order_out, $order_desc) = split(/\t/, $order);
	my @order_desc_list = split(/ /, $order_desc);
	for (my $i =1; $i < @order_set && $i < @order_desc_list; $i++) {
		my $data = "";
		if ($order_desc_list[$i] =~ /^A+$/) {
			# アドレス: ラベルを反映する
			my $addr = $labels{$order_set[$i]};
			if (defined($addr)) {
				$data = &str2bin($addr, length($order_desc_list[$i]));
			} else {
				$data = $order_set[$i];
			}
		} else {
			if ($order_set[$i] eq "R0") {$data = "0";}
			elsif ($order_set[$i] eq "R1") {$data = "1";}
			elsif ($order_set[$i] eq "R2") {$data = "10";}
			elsif ($order_set[$i] eq "R3") {$data = "11";}
			elsif ($order_set[$i] =~ /^0x/) {
				$data = &hex2bin(substr($order_set[$i], 2));
			} elsif ($order_set[$i] =~ /^0b/) {
				$data = substr($order_set[$i], 2);
			} else {
				$data = &str2bin($order_set[$i], length($order_desc_list[$i]));
			}
		}
		$data = &padding($data, length($order_desc_list[$i]));
		$order_out =~ s/$order_desc_list[$i]/$data/g;
	}
	print "\t\tADDR == 6'b" . str2bin($addr, 6) . " ? 8'b$order_out : // $raw_line\n";
}

# フッタを出力する
print "\t\t8'b00000000\n";
print "\t;\n";
print "\n";
print "endmodule\n";

sub str2bin {
	my ($num, $digit) = @_;
	my $out = "";
	for (my $i = 0; $i < $digit; $i++) {
		$out = ($num % 2 ? "1" : "0") . $out;
		$num >>= 1;
	}
	return $out;
}

sub padding {
	my ($data, $digit) = @_;
	if (length($data) >= $digit) {return $data;}
	return ("0" x ($digit - length($data))) . $data;
}

sub hex2bin {
	my ($hex) = @_;
	$hex =~ s/([01])/$1=="0"?"0000":"0001"/eg;
	$hex =~ s/2/0010/g;
	$hex =~ s/3/0011/g;
	$hex =~ s/4/0100/g;
	$hex =~ s/5/0101/g;
	$hex =~ s/6/0110/g;
	$hex =~ s/7/0111/g;
	$hex =~ s/8/1000/g;
	$hex =~ s/9/1001/g;
	$hex =~ s/A/1010/ig;
	$hex =~ s/B/1011/ig;
	$hex =~ s/C/1100/ig;
	$hex =~ s/D/1101/ig;
	$hex =~ s/E/1110/ig;
	$hex =~ s/F/1111/ig;
	$hex =~ s/^0+//;
	return $hex;
}
