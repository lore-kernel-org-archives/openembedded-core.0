Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2EF6C3E1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 16:02:14 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id u8so23197188iom.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Nov 2019 08:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=emJ9zKK2PXUF6L5oTJUVtcOo9+8xPVFePOWjZggMZBY=;
	b=TQTTDJkxo6me70bbet/XetH+EutWZFonoVl7cZujx8iWx7miUjn73cfSbb/QO7u5CO
	EQSkyaZAS8v/yZCxTmAdvjWAQev/pGtb8TtXhTeEcIPTKsO94zLgpyf5GtRw/liWhGxA
	LjAKXq3aN1sUWbhDAcRudgG3mejsK/PZxw0cJlKl4rsIhh14mUECkVWmamTzTXEZtVSz
	kGwSMkcJvrA2a36xFT6KLag/ZyWhAI7tXm+EFd6yXcUUU/VWvq796vok3loE2lPcrZhb
	rA5RTfkWzOwWZtu0QrNxRzdBQT3HFbel1A5t3KTVSqfSddNPDJPo8K7PGuMyAcZH8Pil
	k+Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=emJ9zKK2PXUF6L5oTJUVtcOo9+8xPVFePOWjZggMZBY=;
	b=TIjnnTmO8tROkxlipw7BHIOaXNZ0X8BE8PxH5079G4FF27kSWx9D3eT5vOAZD718ss
	0/q4XRhS9S92n44sXRwp/oiVxwBj62NgVJi6ZUKdrRYOAGq7lXT1AFAVOtV913nQ5D9G
	vS/5KLLjpOAP27BTffJcDEXdQQIYmksHkZ0KQumBUHeNdW2xbqTDiB7x5H6G7TzgQcex
	5Kxhk26HN1IKzMukH2pMv0K2JY8twZ846bwHP+5QAXOfy15mhdqu41L1HjqpotttiiTr
	/RxTeYuvOpH+WW11IN+D+8HNbYpOFnWIw5EoEfjUlHoIk6E80LIzaEvKE4HEHa8BroWc
	OhzQ==
X-Gm-Message-State: APjAAAU3Eu0qS9Ahk216p0eoWcvRai6EcXkmmNv7ibvwIye09GuuuFbf
	h609QBbntj3bsraAJgq+3y/fASbwmN/6p2BTdCjOAbyd
X-Google-Smtp-Source: APXvYqz3qvQ5VcYOhn1gxZUYWjDoISL0vR7cPslM3P9KNnqP/RIHJ8QBvOtsmakRhD/HEaoBqNWZqz9hethDFh36cyI=
X-Received: by 2002:a02:3804:: with SMTP id b4mr21871191jaa.79.1572969734491; 
	Tue, 05 Nov 2019 08:02:14 -0800 (PST)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 5 Nov 2019 08:02:04 -0800
Message-ID: <CAK5yBb-Y+KOR_L6VELGQ-YFZU9FzXp5XosrKpL+znhLOhNDWsg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org, yocto@yoctoproject.org
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1c0NeKAmTE5?=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Nov 2019 16:02:14 -0000
Content-Type: multipart/alternative; boundary="000000000000445c7805969b8e40"

--000000000000445c7805969b8e40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 3.1 M1

Next Deadline: YP 3.1 M1 build Dec. 2, 2019

SWAT Team Rotation:

   -

   SWAT lead is currently: Armin
   -

   SWAT team rotation: Armin-> Anuj on Nov. 8, 2019
   -

   SWAT team rotation: Anuj -> Chen on Nov. 15, 2019
   -

   https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Next Team Meetings:

   -

   Bug Triage meeting Thursday Nov. 7th at 7:30am PDT (
   https://zoom.us/j/454367603)
   -

   Monthly Project Meeting Tuesday Nov. 5th at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Weekly Engineering Sync Tuesday Nov. 12th at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Twitch - Next event is Tuesday Nov. 12th at 8am PDT (
   https://www.twitch.tv/yocto_project)


Key Status/Updates:

   -

   The project presence at ELC-E in Lyon was strong, thanks to everyone who
   contributed, be it through presentations, helping with the booth, visiti=
ng
   the booth or attending or assisting with the summit!
   -

   YP 2.6.4 was released
   -

   Patches have continued to merge and master is staying roughly current
   with the pending patch queue. The autobuilder is still suffering a numbe=
r
   of intermittent failures which will start to hamper future development.
   We=E2=80=99re likely going to have to pause and address those before oth=
er
   development can continue.
   -

   In particular, issues with pseudo on fedora30 have become apparent due
   to its use of the new statx() syscall.
   -

   YP 2.7.2 has been built and is now in QA
   -

   The YP TSC worked on and shared a proposal on how an LTS release could
   work which is available at:
   https://docs.google.com/document/d/1AwAFDf52f_FoXksbHEVUMlu4hpcI0JMGVG-K=
j_sUkyc/
   -

   We are continuing to collect ideas for YP 3.1 in this document:
   https://docs.google.com/document/d/1UKZIGe88-eq3-pOPtkAvFAegbQDzhy_f4ye6=
4yjnABc/edit?usp=3Dsharing
   -

   If anyone has any status items for the project they=E2=80=99d like to ad=
d to the
   weekly reports, please email Richard and Stephen.


Proposed YP 3.1 Milestone Dates:

   -

   YP 3.1 M1 Proposed build date 12/2/2019
   -

   YP 3.1 M1 Proposed release date 12/13/2019
   -

   YP 3.1 M2 Proposed build date 1/20/2020
   -

   YP 3.1 M2 Proposed release date 1/31/2020
   -

   YP 3.1 M3 Proposed build date 2/24/2020
   -

   YP 3.1 M3 Proposed release date 3/6/2020
   -

   YP 3.1 M4 Proposed build date  3/30/2020
   -

   YP 3.1 M4 Proposed release date  4/24/2020


Planned upcoming dot releases:

   -

   YP 3.0.1 has patches being queued in poky-contrib
   -

   YP 2.7.2 (Warrior) is in QA.
   -

   YP 2.6.4 (Thud) was released.


Tracking Metrics:

   -

   WDD 2518 (last week 2493) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   Poky Patch Metrics
   -

      Total patches found: 1446 (last week 1441)
      -

      Patches in the Pending State: 579 (40%) [last week 579 (40%)]


The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

*7867 SW Bayberry Dr., Beaverton, OR 97007*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--000000000000445c7805969b8e40
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-aaa53fff-7fff-ec25-20=
e0-af46745d94ce"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Current D=
ev Position: YP 3.1 M1=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Next Deadline: YP 3.1 M1 build Dec. 2, 2019</span></p><br><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap">SWAT Team Rotation:</span></p>=
<ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line=
-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT lead is c=
urrently: Armin=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre-wrap">SWAT team rotation: Armi=
n-&gt; Anuj on Nov. 8, 2019</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team rotation=
: Anuj -&gt; Chen on Nov. 15, 2019</span></p></li><li dir=3D"ltr" style=3D"=
list-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"=
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D"=
text-decoration-line:none"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;text-=
decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">htt=
ps://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a></p=
></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Next Team M=
eetings:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">Bug Triage meeting Thursday Nov. 7th at 7:30am PDT (</span><a href=
=3D"https://zoom.us/j/454367603" style=3D"text-decoration-line:none"><span =
style=3D"font-size:10pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;text-decoration-line:underline;vertica=
l-align:baseline;white-space:pre-wrap">https://zoom.us/j/454367603</span></=
a><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:d=
isc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">Monthly Project Meeting Tues=
day Nov. 5th at 8am PDT (</span><a href=3D"https://zoom.us/j/990892712" sty=
le=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;text-decoration-line:underline;vertical-align:baseline;white-space:pre-wra=
p">https://zoom.us/j/990892712)</span></a></p></li><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Weekly Eng=
ineering Sync Tuesday Nov. 12th at 8am PDT (</span><a href=3D"https://zoom.=
us/j/990892712" style=3D"text-decoration-line:none"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;text-decoration-line:underline;vertical-align:baseline;=
white-space:pre-wrap">https://zoom.us/j/990892712)</span></a></p></li><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap">Twitch - Next event is Tuesday Nov. 12th at 8am PDT (</span><a hre=
f=3D"https://www.twitch.tv/yocto_project" style=3D"text-decoration-line:non=
e"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;text-decoration-line:underlin=
e;vertical-align:baseline;white-space:pre-wrap">https://www.twitch.tv/yocto=
_project</span></a><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre-wrap">)</span></p></li></ul><br><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre-wrap">Key Status/Updates:</span></p><ul style=3D=
"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type=
:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38=
;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background=
-color:transparent;font-variant-numeric:normal;font-variant-east-asian:norm=
al;vertical-align:baseline;white-space:pre-wrap">The project presence at EL=
C-E in Lyon was strong, thanks to everyone who contributed, be it through p=
resentations, helping with the booth, visiting the booth or attending or as=
sisting with the summit!=C2=A0</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 2.6.4 was re=
leased</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-si=
ze:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">Patches have continued to merge and mas=
ter is staying roughly current with the pending patch queue. The autobuilde=
r is still suffering a number of intermittent failures which will start to =
hamper future development. We=E2=80=99re likely going to have to pause and =
address those before other development can continue.</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">In particular, issues with pseudo on fedora30 have become apparent =
due to its use of the new statx() syscall.</span></p></li><li dir=3D"ltr" s=
tyle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP =
2.7.2 has been built and is now in QA</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">The YP=
 TSC worked on and shared a proposal on how an LTS release could work which=
 is available at: </span><a href=3D"https://docs.google.com/document/d/1AwA=
FDf52f_FoXksbHEVUMlu4hpcI0JMGVG-Kj_sUkyc/" style=3D"text-decoration-line:no=
ne"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;text-decoration-line:underli=
ne;vertical-align:baseline;white-space:pre-wrap">https://docs.google.com/do=
cument/d/1AwAFDf52f_FoXksbHEVUMlu4hpcI0JMGVG-Kj_sUkyc/</span></a></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">We are continuing to collect ideas for YP 3.1 in this document=
: </span><a href=3D"https://docs.google.com/document/d/1UKZIGe88-eq3-pOPtkA=
vFAegbQDzhy_f4ye64yjnABc/edit?usp=3Dsharing" style=3D"text-decoration-line:=
none"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;text-decoration-line:under=
line;vertical-align:baseline;white-space:pre-wrap">https://docs.google.com/=
document/d/1UKZIGe88-eq3-pOPtkAvFAegbQDzhy_f4ye64yjnABc/edit?usp=3Dsharing<=
/span></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre-wrap">If anyone has any status items for the pro=
ject they=E2=80=99d like to add to the weekly reports, please email Richard=
 and Stephen.</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">Proposed YP 3.1 Milestone Dates:</span></p><ul style=3D"margin-=
top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">YP 3.1 M1 Proposed build date 12/2=
/2019</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-siz=
e:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">YP 3.1 M1 Proposed release date 12/13/20=
19</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:1=
1pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">YP 3.1 M2 Proposed build date 1/20/2020</sp=
an></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;font=
-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:basel=
ine;white-space:pre-wrap">YP 3.1 M2 Proposed release date 1/31/2020</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">YP 3.1 M3 Proposed build date 2/24/2020</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">YP 3.1 M3 Proposed release date 3/6/2020</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">YP 3.1 M4 Proposed build date=C2=A0 3/30/2020</span></p></li><li=
 dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">YP 3.1 M4 Proposed release date=C2=A0 4/24/2020</span></p></li><=
/ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">Planned upcoming d=
ot releases:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li d=
ir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;c=
olor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re-wrap">YP 3.0.1 has patches being queued in poky-contrib</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Ari=
al;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><=
span style=3D"font-size:11pt;background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">YP 2.7.2 (Warrior) is in QA.</span></p></li><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 2=
.6.4 (Thud) was released.</span></p></li></ul><br><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:=
11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">Tracking Metrics:</span></p><ul style=3D"margin-top=
:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">WDD 2518 (last week 2493)</span><span=
 style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap"> (</span><a href=3D"https://wiki.y=
octoproject.org/charts/combo.html" style=3D"text-decoration-line:none"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;text-decoration-line:underline;verti=
cal-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/char=
ts/combo.html</span></a><span style=3D"font-size:11pt;font-family:Consolas,=
sans-serif;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">)</sp=
an></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fo=
nt-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre-wrap">Poky Patch Metric=
s=C2=A0=C2=A0</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px"=
><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">Total patches found: 1446 (last week 1441)</span></p></li>=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Consolas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-vari=
ant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;w=
hite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">Patches in the Pending Stat=
e: 579 (40%) [last week 579 (40%)]</span></p></li></ul></ul><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">The Yocto Project=E2=80=99s technical=
 governance is through its Technical Steering Committee, more information i=
s available at:</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/TSC=
" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-fa=
mily:Arial;background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;text-decoration-line:underline;vertical-align:basel=
ine;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/TSC</span></a>=
</p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">The Status reports=
 are now stored on the wiki at: </span><a href=3D"https://wiki.yoctoproject=
.org/wiki/Weekly_Status" style=3D"text-decoration-line:none"><span style=3D=
"font-size:11pt;font-family:Arial;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;text-decoration-line:underli=
ne;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.=
org/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">[If anyone has suggestions for other information you=E2=80=
=99d like to see on this weekly status update, let us know!]</span></p></sp=
an><div><br></div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><p class=3D"Mso=
Normal" style=3D"background-image:initial;background-position:initial;backg=
round-repeat:initial"><span style=3D"font-size:12pt;font-family:Arial,sans-=
serif">Thanks,<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:12pt;font-fam=
ily:Arial,sans-serif">=C2=A0<span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><i><span style=3D"font-size:16pt;co=
lor:purple">Stephen K. Jolley</span></i></b><span style=3D"font-size:12pt;f=
ont-family:Arial,sans-serif"><span></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-size:8pt;font-f=
amily:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager<spa=
n></span></span></b></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><b><span style=3D"font-family:&quot;Co=
urier New&quot;;color:fuchsia;background-image:initial;background-position:=
initial;background-repeat:initial">7867 SW Bayberry Dr., Beaverton, OR 9700=
7</span></b><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><sp=
an></span></span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings;color:black">(</span><span style=3D"font-size:9pt;font-family:=
&quot;MS Sans Serif&quot;,serif;color:teal">=C2=A0=C2=A0=C2=A0=C2=A0</span>=
<b><span style=3D"font-size:8pt;font-family:&quot;Comic Sans MS&quot;;color=
:teal">Cell</span></b><span style=3D"font-size:9pt;font-family:&quot;MS San=
s Serif&quot;,serif;color:teal">:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 </span><span style=3D"font=
-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif">(208) 244-4460</span=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif"><span></span><=
/span></p>

<p class=3D"MsoNormal" style=3D"background-image:initial;background-positio=
n:initial;background-repeat:initial"><span style=3D"font-size:9pt;font-fami=
ly:Wingdings">*=C2=A0</span><b><span lang=3D"FR" style=3D"font-size:8pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Email</span></b><span lang=
=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,serif;=
color:teal">:</span><span lang=3D"FR" style=3D"font-size:9pt;font-family:&q=
uot;MS Sans Serif&quot;,serif">=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0</span><u><span=
 lang=3D"FR" style=3D"font-size:9pt;font-family:&quot;MS Sans Serif&quot;,s=
erif;color:blue"><span style=3D"color:rgb(17,85,204)"><a href=3D"mailto:ste=
phen.k.jolley@intel.com" target=3D"_blank">s</a><a href=3D"mailto:jolley.yp=
.pm@gmail.com" target=3D"_blank">jolley.yp.pm@gmail.com</a></span></span></=
u></p></div></div></div></div></div>

--000000000000445c7805969b8e40--
