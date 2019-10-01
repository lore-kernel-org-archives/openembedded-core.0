Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
	[209.85.166.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5AAC06C1CA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Oct 2019 14:54:16 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id a1so48710349ioc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 Oct 2019 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=lgNir8i0TNHbKdcTIPPhPKw/w1bMMVdpjuD1Nc1S2a4=;
	b=qvkyx3zEMZpEuKk625ckKvBc0OWoixheCYfOkihcYnYBuAxW+XauHRSDCuitK8rFso
	kfZLV4DvOqYidUyYvZDyguegYHXdOrX9INMHin3JCrKRwQDJrFzapBOsTGvXR/IIMIyD
	cfO+DpeGjxXxKJXw0PdaClqki8xCAH6/fgz/OmWND8IHCJISGJeug0erRhTcnKQImagF
	ufWVYxRvDscbE9g+pfK7CRtKpzjg2EWT3lSMtgJ/+otZlOZjyDG5TCjU6ARTeExwVJP4
	kB4pFY0H4p08eUpFnZ0f6flPNG2oVdcH+rl3+kLEhoHuJMRAbMZdpqwPqX2RJVXUCXcb
	FTIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=lgNir8i0TNHbKdcTIPPhPKw/w1bMMVdpjuD1Nc1S2a4=;
	b=EwYGiLZzNUPHPhz5BKGxDER+KYnfd/eq9yKDNK2s8zQslWNOOqLT9BsaAKV8KxRwyG
	aKhXUi8SzaBJhf4AZJMj/YwIh2MoXvcoHcMg2JMEO2sM0J1nniQPWATXEhADvIGbShp4
	6VK2kI8tlqY4gzOH1yh2DAH9acgzUMmHF47KAw7yisP+SbMZ+2sM+YCuOfFuHL40TdCc
	umYIJqoHw3eEkXUbM4C8f3dVrIg2P88ShGQYRwVioOC5oengeigJVAh0wFnVhwLQHad5
	XuUz+HRtZMQQbN8iT56jurbyCNKKstoP4i2GsZCfxDg7xSfJ/fQt6QUO/N37GAFAkB49
	ic8w==
X-Gm-Message-State: APjAAAU2B9T26HyMOHIVvwKkCeGiEAsNmvx8kUdw8T6HKuNwaqKnr9KT
	ka4CcNDFLayrtbTRJOzv4wYWPrvaP8y2UCl1Lw8=
X-Google-Smtp-Source: APXvYqw9n2D7Qv3HfPjmlUXzRIaMFp/6rl9NkcuEduRyEZCeyyThe2ZCgsxSH4ICUuWpd6Vd20ouwe8CAqU62VGcyeE=
X-Received: by 2002:a5e:da0a:: with SMTP id x10mr74972ioj.286.1569941657293;
	Tue, 01 Oct 2019 07:54:17 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 1 Oct 2019 07:54:05 -0700
Message-ID: <CAK5yBb9KAnpTGSC_V4W40AwD7nSPm-Q+RcxRBqMLHLw=ykBcNA@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1c0MOKAmTE5?=
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
X-List-Received-Date: Tue, 01 Oct 2019 14:54:16 -0000
Content-Type: multipart/alternative; boundary="000000000000cd19fa0593da86af"

--000000000000cd19fa0593da86af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.8 M4 Feature Freeze

Next Deadline: YP 3.0 Final Release 25th Oct

SWAT Team Rotation:

   -

   SWAT lead is currently: Armin
   -

   SWAT team rotation: Armin -> Chen on Oct. 4, 2019
   -

   SWAT team rotation: Chen -> Anuj on Oct. 11, 2019
   -

   https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Next Team Meetings:

   -

   Bug Triage meeting Thursday Oct. 3rd at 7:30am PDT (
   https://zoom.us/j/454367603)
   -

   Monthly Project Meeting Tuesday Oct. 1st at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Weekly Engineering Sync Tuesday Oct. 8th at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Twitch - Next event is Tuesday Octt. 8th at 8am PDT (
   https://www.twitch.tv/yocto_project)


Key Status/Updates:

   -

   We=E2=80=99re now in feature freeze in M4 for 3.0 and working on bug fix=
ing for
   final release
   -

   We have a QA report for M3 and this is due for release this week
   -

   The known issues to be addressed before M4 rc1 is built:
   -

      Strace kernel timeout problems
      -

      Better solution for systemd hwdb timeout
      -

      Fixes for the lsb->altcfg release directory names
      -

      Fix for hashserv bitbake-selftest server shutdown issue
      -

      There is bitbake upgrade problem where an older OE-Core doesn=E2=80=
=99t work
      with a newer bitbake due to bb.build.FuncFailed being missing#
      -

   The aim is to build M4 rc1 this week if at all possible but it depends
   on the above issues being fixed (there are open high bugs for these)
   -

   A significant performance problem has been found on the autobuilder
   where some builds are scaling in time badly as the sstate cache grows,
   taking 12 hours or more in some cases. Unfortunately nobody seems motiva=
ted
   to help work on this kind of issue.
   -

   If anyone has any status items for the project they=E2=80=99d like to ad=
d to the
   weekly reports, please email Richard+Stephen.


Planned Releases for YP 3.0 {2.8}:

   -

   M3 Release this week.
   -

   M4 Cutoff 30th Sept - this will be YP 3.0.
   -

   YP 3.0 {2.8 (M4)} Final Release 25th Oct


Planned upcoming dot releases:

   -

   YP 2.7.2 (Warrior) is planned for after YP 3.0 release.
   -

   YP 2.6.4 (Thud) is planned for after YP 2.7.2  release.


Tracking Metrics:

   -

   WDD 2552 (last week 2505) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   Poky Patch Metrics
   -

      Total patches found: 1440 (last week 1427)
      -

      Patches in the Pending State: 587 (41%) [last week 587 (41%)]


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.8_Features

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

--000000000000cd19fa0593da86af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-75a72f9f-7fff-1ca9-0d=
0f-f7613be360d6"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Current D=
ev Position: YP 2.8 M4 Feature Freeze</span></p><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre-wrap">Next Deadline: YP 3.0 Final Release 25th Oct</span></=
p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">SWAT Team Rotation:<=
/span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" st=
yle=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,=
0);background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:11pt;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT=
 lead is currently: Armin</span></p></li><li dir=3D"ltr" style=3D"list-styl=
e-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-heigh=
t:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;back=
ground-color:transparent;font-variant-numeric:normal;font-variant-east-asia=
n:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team rotation: =
Armin -&gt; Chen on Oct. 4, 2019</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team rot=
ation: Chen -&gt; Anuj on Oct. 11, 2019</span></p></li><li dir=3D"ltr" styl=
e=3D"list-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;co=
lor:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;fon=
t-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a hre=
f=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team" styl=
e=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
text-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap=
">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></=
a></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:r=
gb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Next T=
eam Meetings:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li =
dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;=
color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p d=
ir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><spa=
n style=3D"font-size:11pt;background-color:transparent;font-variant-numeric=
:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:=
pre-wrap">Bug Triage meeting Thursday Oct. 3rd at 7:30am PDT (</span><a hre=
f=3D"https://zoom.us/j/454367603" style=3D"text-decoration-line:none"><span=
 style=3D"font-size:10pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-decoration-line:underline;vertic=
al-align:baseline;white-space:pre-wrap">https://zoom.us/j/454367603</span><=
/a><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">Monthly Project Meeting Tue=
sday Oct. 1st at 8am PDT (</span><a href=3D"https://zoom.us/j/990892712" st=
yle=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;text-decoration-line:underline;vertical-align:baseline;white-space:pre-wr=
ap">https://zoom.us/j/990892712)</span></a></p></li><li dir=3D"ltr" style=
=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Weekly=
 Engineering Sync Tuesday Oct. 8th at 8am PDT (</span><a href=3D"https://zo=
om.us/j/990892712" style=3D"text-decoration-line:none"><span style=3D"font-=
size:11pt;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;text-decoration-line:underline;vertical-align:baseli=
ne;white-space:pre-wrap">https://zoom.us/j/990892712)</span></a></p></li><l=
i dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Aria=
l;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">Twitch - Next event is Tuesday Octt. 8th at 8am PDT (</span><a =
href=3D"https://www.twitch.tv/yocto_project" style=3D"text-decoration-line:=
none"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;text-decoration-line:under=
line;vertical-align:baseline;white-space:pre-wrap">https://www.twitch.tv/yo=
cto_project</span></a><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">)</span></p></li></ul><br><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">Key Status/Updates:</span></p><ul sty=
le=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">We=E2=80=99re now in =
feature freeze in M4 for 3.0 and working on bug fixing for final release</s=
pan></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;f=
ont-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre-wrap">We have a QA report for M3 and this is due for r=
elease this week</span></p></li><li dir=3D"ltr" style=3D"list-style-type:di=
sc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">The known issues to be addres=
sed before M4 rc1 is built:</span></p></li><ul style=3D"margin-top:0px;marg=
in-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11=
pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-var=
iant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;=
white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent=
;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:=
baseline;white-space:pre-wrap">Strace kernel timeout problems</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Better solution for systemd hwdb timeout</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:A=
rial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:nor=
mal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"=
><span style=3D"font-size:11pt;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre-wrap">Fixes for the lsb-&gt;altcfg release directory names</span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font=
-family:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-s=
pace:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-v=
ariant-numeric:normal;font-variant-east-asian:normal;vertical-align:baselin=
e;white-space:pre-wrap">Fix for hashserv bitbake-selftest server shutdown i=
ssue</span></p></li><li dir=3D"ltr" style=3D"list-style-type:circle;font-si=
ze:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fon=
t-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:base=
line;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre-wrap">There is bitbake upgrade problem where =
an older OE-Core doesn=E2=80=99t work with a newer bitbake due to bb.build.=
FuncFailed being missing#</span></p></li></ul><li dir=3D"ltr" style=3D"list=
-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgrou=
nd-color:transparent;font-variant-numeric:normal;font-variant-east-asian:no=
rmal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;background-color:transparent;font-variant-numeric:normal;font-variant-east=
-asian:normal;vertical-align:baseline;white-space:pre-wrap">The aim is to b=
uild M4 rc1 this week if at all possible but it depends on the above issues=
 being fixed (there are open high bugs for these)</span></p></li><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">A significant performance problem has been found on the autobuilder whe=
re some builds are scaling in time badly as the sstate cache grows, taking =
12 hours or more in some cases. Unfortunately nobody seems motivated to hel=
p work on this kind of issue.</span></p></li><li dir=3D"ltr" style=3D"list-=
style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgroun=
d-color:transparent;font-variant-numeric:normal;font-variant-east-asian:nor=
mal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">If anyone has an=
y status items for the project they=E2=80=99d like to add to the weekly rep=
orts, please email Richard+Stephen.</span></p></li></ul><br><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">Planned Releases for YP 3.0 {2.8}:</span>=
</p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D=
"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size=
:11pt;background-color:transparent;font-variant-numeric:normal;font-variant=
-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">M3 Release=
 this week.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:t=
ransparent;font-variant-numeric:normal;font-variant-east-asian:normal;verti=
cal-align:baseline;white-space:pre-wrap">M4 Cutoff 30th Sept - this will be=
 YP 3.0.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-=
size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">YP 3.0 {2.8 (M4)} Final Release 25th =
Oct</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap=
">Planned upcoming dot releases:</span></p><ul style=3D"margin-top:0px;marg=
in-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;background-color:transparent;f=
ont-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:ba=
seline;white-space:pre-wrap">YP 2.7.2 (Warrior) is planned for after YP 3.0=
 release.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font=
-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">YP 2.6.4 (Thud) is planned for after=
 YP 2.7.2=C2=A0 release.</span></p></li></ul><br><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-va=
riant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline=
;white-space:pre-wrap">Tracking Metrics:</span></p><ul style=3D"margin-top:=
0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-s=
ize:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;fo=
nt-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:bas=
eline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:trans=
parent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-=
align:baseline;white-space:pre-wrap">WDD 2552 (last week 2505)</span><span =
style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertic=
al-align:baseline;white-space:pre-wrap"> (</span><a href=3D"https://wiki.yo=
ctoproject.org/charts/combo.html" style=3D"text-decoration-line:none"><span=
 style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;text-decoration-line:underline;vertic=
al-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/chart=
s/combo.html</span></a><span style=3D"font-size:11pt;font-family:Consolas,s=
ans-serif;background-color:transparent;font-variant-numeric:normal;font-var=
iant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">)</spa=
n></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;fon=
t-family:Consolas,sans-serif;color:rgb(0,0,0);background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-to=
p:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">Poky Patch Metrics=
=C2=A0=C2=A0</span></p></li><ul style=3D"margin-top:0px;margin-bottom:0px">=
<li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:no=
rmal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre=
"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-=
space:pre-wrap">Total patches found: 1440 (last week 1427)</span></p></li><=
li dir=3D"ltr" style=3D"list-style-type:circle;font-size:11pt;font-family:C=
onsolas,sans-serif;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;background-c=
olor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal=
;vertical-align:baseline;white-space:pre-wrap">Patches in the Pending State=
: 587 (41%) [last week 587 (41%)]</span></p></li></ul></ul><br><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical=
-align:baseline;white-space:pre-wrap">Key Status Links for YP:</span></p><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a=
 href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status" styl=
e=3D"text-decoration-line:none"><span style=3D"font-size:11pt;font-family:C=
onsolas,sans-serif;background-color:transparent;font-variant-numeric:normal=
;font-variant-east-asian:normal;text-decoration-line:underline;vertical-ali=
gn:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Yocto_=
Project_v2.8_Status</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/=
wiki/Yocto_2.8_Schedule" style=3D"text-decoration-line:none"><span style=3D=
"font-size:11pt;font-family:Consolas,sans-serif;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;text-decoratio=
n-line:underline;vertical-align:baseline;white-space:pre-wrap">https://wiki=
.yoctoproject.org/wiki/Yocto_2.8_Schedule</span></a></p><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://=
wiki.yoctoproject.org/wiki/Yocto_2.8_Features" style=3D"text-decoration-lin=
e:none"><span style=3D"font-size:11pt;font-family:Consolas,sans-serif;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;text-decoration-line:underline;vertical-align:baseline;white-space:=
pre-wrap">https://wiki.yoctoproject.org/wiki/Yocto_2.8_Features</span></a><=
/p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-botto=
m:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);bac=
kground-color:transparent;font-variant-numeric:normal;font-variant-east-asi=
an:normal;vertical-align:baseline;white-space:pre-wrap">The Yocto Project=
=E2=80=99s technical governance is through its Technical Steering Committee=
, more information is available at:</span></p><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yocto=
project.org/wiki/TSC" style=3D"text-decoration-line:none"><span style=3D"fo=
nt-size:11pt;font-family:Arial;background-color:transparent;font-variant-nu=
meric:normal;font-variant-east-asian:normal;text-decoration-line:underline;=
vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.org=
/wiki/TSC</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap=
">The Status reports are now stored on the wiki at: </span><a href=3D"https=
://wiki.yoctoproject.org/wiki/Weekly_Status" style=3D"text-decoration-line:=
none"><span style=3D"font-size:11pt;font-family:Arial;background-color:tran=
sparent;font-variant-numeric:normal;font-variant-east-asian:normal;text-dec=
oration-line:underline;vertical-align:baseline;white-space:pre-wrap">https:=
//wiki.yoctoproject.org/wiki/Weekly_Status</span></a></p><br><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpa=
rent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-al=
ign:baseline;white-space:pre-wrap">[If anyone has suggestions for other inf=
ormation you=E2=80=99d like to see on this weekly status update, let us kno=
w!]</span></p></span><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_=
signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div di=
r=3D"ltr"><p class=3D"MsoNormal" style=3D"background-image:initial;backgrou=
nd-position:initial;background-repeat:initial"><span style=3D"font-size:12p=
t;font-family:Arial,sans-serif">Thanks,<span></span></span></p>

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

--000000000000cd19fa0593da86af--
