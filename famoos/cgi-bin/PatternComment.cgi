#!/usr/local/bin/perl

$INC_PERLLIB = "/home/scg/local/perl/lib";


$F_COMMENT = "Comment";
$F_SENDER  = "Sender";
$WEBMASTER = "tichel";


unshift(@INC,$INC_PERLLIB);

require("cgi-lib.pl");

&ReadParse();

print &PrintHeader();

open(FH,"| mail $WEBMASTER");
print FH <<EOF;
Subject: Reengineering Pattern Comment

COMMENT
\n$in{$F_COMMENT}

SENDER
$in{$F_SENDER}
EOF

close(FH);

print <<EOF
<HTML VERSION="2.0">

<HEAD>
 <TITLE>SCG / FAMOOS / Candidate Reengineering  Patterns</TITLE>
 <BASE HREF= "http://www.iam.unibe.ch/~famoos/">
 <LINK REV="MADE" HREF="mailto:famoos\@iam.unibe.ch">
</HEAD>
<BODY BGCOLOR="#FFFFFF">
<!-- MAIN-MENU -->
<CENTER>
	  <A HREF= "">FAMOOS Home</A>
	| <A HREF= "mailto:famoos\@iam.unibe.ch">E-mail Feedback</A>
</CENTER>
<HR>
<!-- /MAIN-MENU -->
<TABLE>
<TR>

<A HREF = "http://dis.sema.es/projects/FAMOOS/">
   <IMG ALT="FAMOOS Logo" SRC="Images/bigfamoos.gif" WIDTH=75 HEIGHT=83 ALIGN=left BORDER=0 >
  </A>
   
<TD VALIGN=TOP>
<a href="http://www.iam.unibe.ch/~famoos/">The Famoos Team</a>
thanks you for your feedback !
<p>
Your mail will be handled in the next few days !
<HR>

</TD>
<TD ROWSPAN=2>
</TD>
</TR>
</TABLE>


<!-- MAIN-MENU -->
<HR>
<CENTER>
	  <A HREF= "">FAMOOS Home</A>
	| <A HREF= "mailto:famoos\@iam.unibe.ch">E-mail Feedback</A>
</CENTER>
<!-- /MAIN-MENU -->
    
</BODY>

</HTML>
EOF



