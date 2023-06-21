#!/usr/local/bin/perl

$INC_PERLLIB = "/home/scg/local/perl/lib";


$F_URL     = "URL";
$F_COMMENT = "Comment";
$F_SENDER  = "Sender";
$WEBMASTER = "scg";


unshift(@INC,$INC_PERLLIB);

require("cgi-lib.pl");

&ReadParse();

print &PrintHeader();

open(FH,"| mail $WEBMASTER");
print FH <<EOF;
Subject: Web Comment

URL
$in{$F_URL}

COMMENT
\n$in{$F_COMMENT}

SENDER
$in{$F_SENDER}
EOF

close(FH);

print <<EOF
<HTML VERSION="2.0">
<HEAD>
<BASE HREF="http://www.iam.unibe.ch/~scg/">
<TITLE>SCG Feedback Form - Thank you</TITLE>
<META NAME="Author"   CONTENT="scgwww">
<META NAME="Keywords" CONTENT ="">
<META NAME="Index"    CONTENT ="">

</HEAD>


<BODY>

[ <a href="/~scg/">SCG</a>
| <a href="/~scg/Research/">Research</a>
| <a href="/~scg/People/">People</a>
| <a href="/~scg/Resources/">Resources</a>
| <a href="/~scg/Teaching/">Teaching</a>
]

<H1> <IMG SRC="/~scg/Icons/scglogo.gif">Thank you for your contribution</h1>

The 
<a href="http://www.iam.unibe.ch/~scg/Adm.html">SCG webmaster</a>
thanks you for your feedback !
<p>
Your mail will be handled in the next few days !
<HR>
<A HREF="http://www.iam.unibe.ch/~scg/Adm.html"><ADDRESS>scgwww\@iam.unibe.ch</address></a>
EOF



