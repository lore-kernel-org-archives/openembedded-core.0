Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
	[209.85.166.51])
	by mail.openembedded.org (Postfix) with ESMTP id 137D37F962
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 16:13:06 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id n17so2308571ioa.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=jzgrG5hcOyN4qKV5zGcK/XhLhoHuBHRVvs30yvwqUZ4=;
	b=Zgmf6OUaR2Vv1XIgp4fY9nc+O20Ys0gENPg0Dbf4dKE9nUp/T9XwqYEAeppHDwZYDq
	hjhhwsCEajxH61g4f1h0DYst5ZeJtS8ScUxw1Og8BD8nJxnODw14XGJ8bpFdcTYsUnlW
	Z4r3RElRl4WX8pvx+GRhVzzKofbycd/KyWhPYs6cYMQ64emTG51SgIDslW1Rx6/bSIMC
	F50lirxcjwTPkqFP3rfT5Am5zc8FpFYi0oGGjk7sPATeaZjB1w7SlfVEvfuxd/VVRjmS
	wI1mdppKNvbtpb6o5id0tqWozvRC4j2SLAzjtg+OQlJ4TPy8jSzE3ZhU8ZkSTh7W8u8q
	QszA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=jzgrG5hcOyN4qKV5zGcK/XhLhoHuBHRVvs30yvwqUZ4=;
	b=sXetZSMqs89bPvi1IwyLQUsI2kVuvbMl83Psp+nOF3lYTeLVXKuUdiq+LM+cp5/XnH
	E8BkeKD6hOmcWVjYGcHTXDliGOKPE5KxtgGu/1TDJ2JN16783R+s09AdkJlbYtMCwUGL
	yHjYeYiXJR0yp7YRTOIZCm6XiN3N0VOyKq8oeJ6bSyALVTUyv4B/DmSGzbjpZYff9lhz
	tl9p1kvd3RzEHBy5GKkFn6ijE7M0xV3nuIJPTtV7RUBDALterbWcauA/kerM5lbnfQ42
	65Ymx5XPckbYWwxX8EouQPzS91N8YuF3meHeGg+kgXmNt+p7Tez4AG/0o8ZWje1wsreZ
	XkTg==
X-Gm-Message-State: APjAAAUQ/g/HG1wGVGDjPilrFjL5X6FpPWeNUPKtJ41qb09G/9mXkLr/
	euRFrtj431luZaNDdgPb/LgDQs9xx6jwS05yEWQ=
X-Google-Smtp-Source: APXvYqxvbHNlBLP+Rjx2kOi3mv2RGnOA4UfkrNZcyWrDUibpCF0+V0ybBtjvFp+C0RtuDU4qAwKi0ijAac5nWSNfs0c=
X-Received: by 2002:a05:6602:1c4:: with SMTP id
	w4mr4670284iot.286.1572365587846; 
	Tue, 29 Oct 2019 09:13:07 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 29 Oct 2019 09:12:57 -0700
Message-ID: <CAK5yBb8MbsFAmkG3gDLwTdNDYhb1AyQGX2iqCEKhrXo3NJ_FMw@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1c0NOKAmTE5?=
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
X-List-Received-Date: Tue, 29 Oct 2019 16:13:07 -0000
Content-Type: multipart/alternative; boundary="000000000000521bd205960ee445"

--000000000000521bd205960ee445
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 3.1 M1

Next Deadline: YP 3.1 M1 build Dec. 2, 2019

SWAT Team Rotation:

   -

   SWAT lead is currently: Amanda
   -

   SWAT team rotation: Amanda -> Armin on Nov. 1, 2019
   -

   SWAT team rotation: Armin-> Anuj on Nov. 8, 2019
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

   Yocto Project =E2=80=9CZeus=E2=80=9D 3.0 has been released!  Thank you t=
o everyone who
   contributed patches, bugs, feedback and testing.  Some very rough git
   metrics say that 182 different people have contributed patches to this
   cycle.
   -

   This week is ELC-E in Lyon, so meetings are limited.  If anyone reading
   this is there please do visit the Yocto Project booth and say hello!
   -

   Patches have been flowing fast into master.  Due to ELC-E this will slow
   down this week, but Ross will continue to collect patches for testing in
   ross/mut.
   -

   There are ongoing intermittent autobuilder failures, particularly in
   selftest but in other areas too. There is a separate email about this an=
d
   we could do with help in debugging and resolving those issues.
   -

   YP 2.6.4 was built and has passed QA, will be released imminently.
   -

   YP 2.7.2 was held due to an unexplained test failure but will now be
   built in the next few days.
   -

   Armin and Anuj have volunteered to maintain Zeus and they plan to work
   out the maintainership between them, thanks!
   -

   We have begun collecting ideas for YP 3.1 in this document:
   https://docs.google.com/document/d/1UKZIGe88-eq3-pOPtkAvFAegbQDzhy_f4ye6=
4yjnABc/edit?usp=3Dsharing
   -

   If anyone has any status items for the project they=E2=80=99d like to ad=
d to the
   weekly reports, please email Richard and Stephen.


Planned upcoming dot releases:

   -

   YP 2.7.2 (Warrior) is planned this week.
   -

   YP 2.6.4 (Thud) is is to be released shortly.


Tracking Metrics:

   -

   WDD 2493 (last week 2498) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   Poky Patch Metrics
   -

      Total patches found: 1441 (last week 1432)
      -

      Patches in the Pending State: 579 (40%) [last week 578 (41%)]


The Yocto Project=E2=80=99s technical governance is through its Technical S=
teering
Committee, more information is available at:

https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you=E2=80=99d like to see =
on this
weekly status update, let us know!]

--=20

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

*7867 SW Bayberry Dr., Beaverton, OR 97007*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--000000000000521bd205960ee445
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-d6fb0ecf-7fff-51f4-17=
92-69ae392f70e3"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
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
urrently: Amanda</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">SWAT team rotation: Amanda -&=
gt; Armin on Nov. 1, 2019</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team rotation: =
Armin-&gt; Anuj on Nov. 8, 2019</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"htt=
ps://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D"tex=
t-decoration-line:none"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;text-dec=
oration-line:underline;vertical-align:baseline;white-space:pre-wrap">https:=
//wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a></p></=
li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0=
);background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;vertical-align:baseline;white-space:pre-wrap">Next Team Meet=
ings:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"l=
tr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wra=
p">Bug Triage meeting Thursday Nov. 7th at 7:30am PDT (</span><a href=3D"ht=
tps://zoom.us/j/454367603" style=3D"text-decoration-line:none"><span style=
=3D"font-size:10pt;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-decoration-line:underline;vertical-ali=
gn:baseline;white-space:pre-wrap">https://zoom.us/j/454367603</span></a><sp=
an style=3D"font-size:11pt;background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;f=
ont-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpare=
nt;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-alig=
n:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;vert=
ical-align:baseline;white-space:pre-wrap">Monthly Project Meeting Tuesday N=
ov. 5th at 8am PDT (</span><a href=3D"https://zoom.us/j/990892712" style=3D=
"text-decoration-line:none"><span style=3D"font-size:11pt;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;text=
-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">ht=
tps://zoom.us/j/990892712)</span></a></p></li><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">Weekly Engineer=
ing Sync Tuesday Nov. 12th at 8am PDT (</span><a href=3D"https://zoom.us/j/=
990892712" style=3D"text-decoration-line:none"><span style=3D"font-size:11p=
t;background-color:transparent;font-variant-numeric:normal;font-variant-eas=
t-asian:normal;text-decoration-line:underline;vertical-align:baseline;white=
-space:pre-wrap">https://zoom.us/j/990892712)</span></a></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">Twitch - Next event is Tuesday Nov. 12th at 8am PDT (</span><a href=3D"=
https://www.twitch.tv/yocto_project" style=3D"text-decoration-line:none"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;text-decoration-line:underline;ver=
tical-align:baseline;white-space:pre-wrap">https://www.twitch.tv/yocto_proj=
ect</span></a><span style=3D"font-size:11pt;background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre-wrap">)</span></p></li></ul><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">Key Status/Updates:</span></p><ul style=3D"mar=
gin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap">Yocto Project =E2=80=9CZeus=E2=
=80=9D 3.0 has been released!=C2=A0 Thank you to everyone who contributed p=
atches, bugs, feedback and testing.=C2=A0 Some very rough git metrics say t=
hat 182 different people have contributed patches to this cycle.</span></p>=
</li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fami=
ly:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:=
0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre-wrap">This week is ELC-E in Lyon, so meetings are limited.=C2=
=A0 If anyone reading this is there please do visit the Yocto Project booth=
 and say hello!</span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap">Patches have been flowing fast=
 into master.=C2=A0 Due to ELC-E this will slow down this week, but Ross wi=
ll continue to collect patches for testing in ross/mut.</span></p></li><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">There are ongoing intermittent autobuilder failures, particularly=
 in selftest but in other areas too. There is a separate email about this a=
nd we could do with help in debugging and resolving those issues.</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">YP 2.6.4 was built and has passed QA, will be released =
imminently.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">YP 2.7.2 was held due to an unexpl=
ained test failure but will now be built in the next few days.</span></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">Armin and Anuj have volunteered to maintain Zeus and they =
plan to work out the maintainership between them, thanks!</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">We have begun collecting ideas for YP 3.1 in this document: </s=
pan><a href=3D"https://docs.google.com/document/d/1UKZIGe88-eq3-pOPtkAvFAeg=
bQDzhy_f4ye64yjnABc/edit?usp=3Dsharing" style=3D"text-decoration-line:none"=
><span style=3D"font-size:11pt;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;text-decoration-line:underline;=
vertical-align:baseline;white-space:pre-wrap">https://docs.google.com/docum=
ent/d/1UKZIGe88-eq3-pOPtkAvFAegbQDzhy_f4ye64yjnABc/edit?usp=3Dsharing</span=
></a></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;=
font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varian=
t-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whi=
te-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre-wrap">If anyone has any status items for the project =
they=E2=80=99d like to add to the weekly reports, please email Richard and =
Stephen.</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
-wrap">Planned upcoming dot releases:</span></p><ul style=3D"margin-top:0px=
;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">YP 2.7.2 (Warrior) is planned this week.<=
/span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">YP 2.6.4 (Thud) is is to be released shortly.<=
/span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Tr=
acking Metrics:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">WDD 2493 (last week 2498)</span><span style=3D"font-size:11pt;f=
ont-family:Consolas,sans-serif;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap"> (</span><a href=3D"https://wiki.yoctoproject.org/charts/com=
bo.html" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;text-decoration-line:underline;vertical-align:baseline;white-s=
pace:pre-wrap">https://wiki.yoctoproject.org/charts/combo.html</span></a><s=
pan style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-se=
rif;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:norm=
al;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre">=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<span style=3D"font-size:11pt;font-family:Arial;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">Poky Patch Metrics=C2=A0=C2=A0</span></p></=
li><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"=
list-style-type:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D=
"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-siz=
e:11pt;background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Total pat=
ches found: 1441 (last week 1432)</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:circle;font-size:11pt;font-family:Consolas,sans-serif;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial;background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">Patches in the Pending State: 579 (40%) [last week 57=
8 (41%)]</span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-fa=
mily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">The Yocto Project=E2=80=99s technical governance is through its=
 Technical Steering Committee, more information is available at:</span></p>=
<p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt">=
<a href=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-decoration=
-line:none"><span style=3D"font-size:11pt;font-family:Arial;background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;te=
xt-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">=
https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">The Status reports are now stored on the wik=
i at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status" s=
tyle=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-famil=
y:Arial;background-color:transparent;font-variant-numeric:normal;font-varia=
nt-east-asian:normal;text-decoration-line:underline;vertical-align:baseline=
;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Weekly_Status</sp=
an></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre-wrap">[If anyone =
has suggestions for other information you=E2=80=99d like to see on this wee=
kly status update, let us know!]</span></p></span><div><br></div>-- <br><di=
v dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature">=
<div dir=3D"ltr"><div><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"back=
ground-image:initial;background-position:initial;background-repeat:initial"=
><span style=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<span><=
/span></span></p>

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

--000000000000521bd205960ee445--
