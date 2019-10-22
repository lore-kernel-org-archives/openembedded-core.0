Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by mail.openembedded.org (Postfix) with ESMTP id 6A3057F690
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 14:56:06 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id u8so20757650iom.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 07:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=6ZXR6vHlKXJNodAqRyohjK5xGYGWg3icGdi+amS4DVQ=;
	b=UQlTra2gUUsvtuFidzqSzZUUHNHybKZRlLPcWq7aTjNPNqWMsqEbRXOtLrjijGUuXf
	xZSmrRKhH1wVCv8PZXGkYfDX/Rq983rWO6Kkmfb0bCQgYSRGFwX2I/zZ+kHjm9PubpGU
	krC8QOhJhX/Hru87Nc1OsYBa47/c5GGh0axXU3BGzjAksQyoe42xNwtqkLCgzuLSAk63
	w03YM35HMh3Tm2uuB6BtCIJ7jUAbU1f5DTWaYImoy6WEdLUktWhL+rtRuSjQO3QqnzAs
	Ize+neHdpW4wIA8XA81hTrVVXkvWwEyF4n0KbrZdAxiLXwnKIW6E4HF/ZwmdGVrbUgyv
	64+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=6ZXR6vHlKXJNodAqRyohjK5xGYGWg3icGdi+amS4DVQ=;
	b=nqCUHs1LMDfLIieMo8MlbbPdsKy+LmpOqu3/gv6i0+WPBWGZNJprY+ncxcw+c6JE4w
	kuRZYFtwrPb+gUJ2iJPLeUPx3FIvXF6BAQsfqbs2O8AYuVS11lQCRpib0Jp72INhtSSh
	mRF1gacVacvNsE73+bWihX9oLkOK4m4i/IjDDiJD+Pi0um3qiAcdC2DNwSV+B44RYFAF
	ILgi3mCOWGoMLPzdVPoVFfpO69Tx9Rp61u3nEBar7pH4WoUE0w3SkSzhJqU4HuXeHKSE
	Vk9oT1naq3H+htBoyn+pFs0XpEIvbMLFCsshw3JH9N9zaWi3fgcSj+KvT+Y4iKGGshed
	A4/A==
X-Gm-Message-State: APjAAAXhN/LmFhinBX2E84MzLcx202Bpxtnq5TQvS2rpPA3aJyiBX4Jb
	+ER8HGxhZ0UXDCPcyze5klaWmhfnWaDUPAx6bzSPctug
X-Google-Smtp-Source: APXvYqyGVm7uMt7xo0xDPj8YixxbMfc8zcvC6OPJbDkXs0zoEP1sp7PJZaF8GyA+Q+spqUfe+nst4Yqxae9iMAG88PA=
X-Received: by 2002:a5e:c31a:: with SMTP id a26mr4383439iok.0.1571756167829;
	Tue, 22 Oct 2019 07:56:07 -0700 (PDT)
MIME-Version: 1.0
From: Stephen K Jolley <sjolley.yp.pm@gmail.com>
Date: Tue, 22 Oct 2019 07:55:58 -0700
Message-ID: <CAK5yBb-mUW04uuwcv8JfTQSmOsPCdg9s4KeGYz_jNnG-=w_29g@mail.gmail.com>
To: yocto@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1c0M+KAmTE5?=
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
X-List-Received-Date: Tue, 22 Oct 2019 14:56:07 -0000
Content-Type: multipart/alternative; boundary="0000000000000e9e4d059581009b"

--0000000000000e9e4d059581009b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 3.1 M1

Next Deadline: YP 3.0 Final Release 25th Oct

SWAT Team Rotation:

   -

   SWAT lead is currently: Paul
   -

   SWAT team rotation: Ross -> Amanda on Oct. 25, 2019
   -

   SWAT team rotation: Amanda -> Armin on Nov. 1, 2019
   -

   https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Next Team Meetings:

   -

   Bug Triage meeting Thursday Oct. 24th at 7:30am PDT (
   https://zoom.us/j/454367603)
   -

   Monthly Project Meeting Tuesday Nov. 5th at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Weekly Engineering Sync Tuesday Oct. 22th at 8am PDT (
   https://zoom.us/j/990892712) <https://zoom.us/j/990892712>
   -

   Twitch - Next event is Tuesday Nov. 12th at 8am PDT (
   https://www.twitch.tv/yocto_project)


Key Status/Updates:

   -

   YP 3.0 as been approved by the TSC and should be released later this
   week. Only the final tweaks to the release notes remain.
   -

   Master has continued taking patches for post 3.0.
   -

   There are a number of intermittent failures on the autobuiler which are
   causing concern, there is a separate email about this.
   -

   YP  2.6.4 was built and submitted to QA
   -

   YP 2.7.2 was not built due to a remaining bug which needs to be resolved
   first
   -

   Next week is ELC-E and therefore may be quiet on the mailing lists with
   patch merging being delayed.
   -

   We have begun collecting ideas for YP 3.1 in this document:
   https://docs.google.com/document/d/1UKZIGe88-eq3-pOPtkAvFAegbQDzhy_f4ye6=
4yjnABc/edit?usp=3Dsharing
   -

   If anyone has any status items for the project they=E2=80=99d like to ad=
d to the
   weekly reports, please email Richard+Stephen.


Planned Releases for YP 3.0:

   -

   YP 3.0 Final Release 25th Oct


Planned upcoming dot releases:

   -

   YP 2.7.2 (Warrior) is planned this week (assuming the remaining bug is
   resolved).
   -

   YP 2.6.4 (Thud) is in QA..


Tracking Metrics:

   -

   WDD 2498 (last week 2528) (
   https://wiki.yoctoproject.org/charts/combo.html)
   -

   Poky Patch Metrics
   -

      Total patches found: 1432 (last week 1445)
      -

      Patches in the Pending State: 578 (41%) [last week 586 (41%)]


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

Thanks,



*Stephen K. Jolley*

*Yocto Project Program Manager*

*7867 SW Bayberry Dr., Beaverton, OR 97007*

(    *Cell*:                (208) 244-4460

* *Email*:                 *s
<stephen.k.jolley@intel.com>jolley.yp.pm@gmail.com <jolley.yp.pm@gmail.com>=
*

--0000000000000e9e4d059581009b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span id=3D"gmail-docs-internal-guid-77a58f33-7fff-602c-17=
8a-6b3fc0eb8551"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Current D=
ev Position: YP 3.1 M1=C2=A0</span></p><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-f=
amily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-nume=
ric:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spa=
ce:pre-wrap">Next Deadline: YP 3.0 Final Release 25th Oct</span></p><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">SWAT Team Rotation:</span></p=
><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre-wrap">SWAT lead is =
currently: Paul</span></p></li><li dir=3D"ltr" style=3D"list-style-type:dis=
c;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transp=
arent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-a=
lign:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre-wrap">SWAT team rotation: Ross -&gt;=
 Amanda on Oct. 25, 2019</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">SWAT team rotation: A=
manda -&gt; Armin on Nov. 1, 2019</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"lt=
r" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a href=3D"h=
ttps://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D"t=
ext-decoration-line:none"><span style=3D"font-size:11pt;background-color:tr=
ansparent;font-variant-numeric:normal;font-variant-east-asian:normal;text-d=
ecoration-line:underline;vertical-align:baseline;white-space:pre-wrap">http=
s://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a></p>=
</li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margi=
n-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0=
,0);background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">Next Team Me=
etings:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D=
"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:=
rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-va=
riant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wr=
ap">Bug Triage meeting Thursday Oct. 24th at 7:30am PDT (</span><a href=3D"=
https://zoom.us/j/454367603" style=3D"text-decoration-line:none"><span styl=
e=3D"font-size:10pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;text-decoration-line:underline;vertical-al=
ign:baseline;white-space:pre-wrap">https://zoom.us/j/454367603</span></a><s=
pan style=3D"font-size:11pt;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;=
font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color=
:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ver=
tical-align:baseline;white-space:pre-wrap">Monthly Project Meeting Tuesday =
Nov. 5th at 8am PDT (</span><a href=3D"https://zoom.us/j/990892712" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;t=
ext-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap"=
>https://zoom.us/j/990892712)</span></a></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">Weekly Engin=
eering Sync Tuesday Oct. 22th at 8am PDT (</span><a href=3D"https://zoom.us=
/j/990892712" style=3D"text-decoration-line:none"><span style=3D"font-size:=
11pt;background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;text-decoration-line:underline;vertical-align:baseline;wh=
ite-space:pre-wrap">https://zoom.us/j/990892712)</span></a></p></li><li dir=
=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;col=
or:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:11pt;background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e-wrap">Twitch - Next event is Tuesday Nov. 12th at 8am PDT (</span><a href=
=3D"https://www.twitch.tv/yocto_project" style=3D"text-decoration-line:none=
"><span style=3D"font-size:11pt;background-color:transparent;font-variant-n=
umeric:normal;font-variant-east-asian:normal;text-decoration-line:underline=
;vertical-align:baseline;white-space:pre-wrap">https://www.twitch.tv/yocto_=
project</span></a><span style=3D"font-size:11pt;background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">)</span></p></li></ul><br><p dir=3D"ltr" st=
yle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparen=
t;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align=
:baseline;white-space:pre-wrap">Key Status/Updates:</span></p><ul style=3D"=
margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-type:=
disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre-wrap">YP 3.0 as been approved by =
the TSC and should be released later this week. Only the final tweaks to th=
e release notes remain.</span></p></li><li dir=3D"ltr" style=3D"list-style-=
type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-colo=
r:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;ve=
rtical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre-wrap">Master has continued t=
aking patches for post 3.0.</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-=
color:transparent;font-variant-numeric:normal;font-variant-east-asian:norma=
l;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-hei=
ght:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;ba=
ckground-color:transparent;font-variant-numeric:normal;font-variant-east-as=
ian:normal;vertical-align:baseline;white-space:pre-wrap">There are a number=
 of intermittent failures on the autobuiler which are causing concern, ther=
e is a separate email about this.</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:1=
1pt;background-color:transparent;font-variant-numeric:normal;font-variant-e=
ast-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP=C2=A0 2.6=
.4 was built and submitted to QA</span></p></li><li dir=3D"ltr" style=3D"li=
st-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,0,0);backgr=
ound-color:transparent;font-variant-numeric:normal;font-variant-east-asian:=
normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11=
pt;background-color:transparent;font-variant-numeric:normal;font-variant-ea=
st-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP 2.7.2 was =
not built due to a remaining bug which needs to be resolved first</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-fam=
ily:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeri=
c:normal;font-variant-east-asian:normal;vertical-align:baseline;white-space=
:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:11pt;background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">Next week is ELC-E and therefore may be quiet on the ma=
iling lists with patch merging being delayed.</span></p></li><li dir=3D"ltr=
" style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">=
We have begun collecting ideas for YP 3.1 in this document: </span><a href=
=3D"https://docs.google.com/document/d/1UKZIGe88-eq3-pOPtkAvFAegbQDzhy_f4ye=
64yjnABc/edit?usp=3Dsharing" style=3D"text-decoration-line:none"><span styl=
e=3D"font-size:11pt;background-color:transparent;font-variant-numeric:norma=
l;font-variant-east-asian:normal;text-decoration-line:underline;vertical-al=
ign:baseline;white-space:pre-wrap">https://docs.google.com/document/d/1UKZI=
Ge88-eq3-pOPtkAvFAegbQDzhy_f4ye64yjnABc/edit?usp=3Dsharing</span></a></p></=
li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-family=
:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:n=
ormal;font-variant-east-asian:normal;vertical-align:baseline;white-space:pr=
e"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:11pt;background-color:transparent;font-variant-=
numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;white=
-space:pre-wrap">If anyone has any status items for the project they=E2=80=
=99d like to add to the weekly reports, please email Richard+Stephen.</span=
></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rg=
b(0,0,0);background-color:transparent;font-variant-numeric:normal;font-vari=
ant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">Planned=
 Releases for YP 3.0:</span></p><ul style=3D"margin-top:0px;margin-bottom:0=
px"><li dir=3D"ltr" style=3D"list-style-type:disc;font-size:11pt;font-famil=
y:Arial;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:=
normal;font-variant-east-asian:normal;vertical-align:baseline;white-space:p=
re"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt"><span style=3D"font-size:11pt;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">YP 3.0 Final Release 25th Oct</span></p></li></ul><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><sp=
an style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-co=
lor:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;=
vertical-align:baseline;white-space:pre-wrap">Planned upcoming dot releases=
:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">YP=
 2.7.2 (Warrior) is planned this week (assuming the remaining bug is resolv=
ed).</span></p></li><li dir=3D"ltr" style=3D"list-style-type:disc;font-size=
:11pt;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-=
variant-numeric:normal;font-variant-east-asian:normal;vertical-align:baseli=
ne;white-space:pre"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:11pt;background-color:transpar=
ent;font-variant-numeric:normal;font-variant-east-asian:normal;vertical-ali=
gn:baseline;white-space:pre-wrap">YP 2.6.4 (Thud) is in QA..</span></p></li=
></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);=
background-color:transparent;font-variant-numeric:normal;font-variant-east-=
asian:normal;vertical-align:baseline;white-space:pre-wrap">Tracking Metrics=
:</span></p><ul style=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" =
style=3D"list-style-type:disc;font-size:11pt;font-family:Arial;color:rgb(0,=
0,0);background-color:transparent;font-variant-numeric:normal;font-variant-=
east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" s=
tyle=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:11pt;background-color:transparent;font-variant-numeric:normal;font=
-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">WD=
D 2498 (last week 2528)</span><span style=3D"font-size:11pt;font-family:Con=
solas,sans-serif;background-color:transparent;font-variant-numeric:normal;f=
ont-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap"=
> (</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" style=
=3D"text-decoration-line:none"><span style=3D"font-size:11pt;background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;t=
ext-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap"=
>https://wiki.yoctoproject.org/charts/combo.html</span></a><span style=3D"f=
ont-size:11pt;font-family:Consolas,sans-serif;background-color:transparent;=
font-variant-numeric:normal;font-variant-east-asian:normal;vertical-align:b=
aseline;white-space:pre-wrap">)</span></p></li><li dir=3D"ltr" style=3D"lis=
t-style-type:disc;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(=
0,0,0);background-color:transparent;font-variant-numeric:normal;font-varian=
t-east-asian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr"=
 style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D=
"font-size:11pt;font-family:Arial;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;whit=
e-space:pre-wrap">Poky Patch Metrics=C2=A0=C2=A0</span></p></li><ul style=
=3D"margin-top:0px;margin-bottom:0px"><li dir=3D"ltr" style=3D"list-style-t=
ype:circle;font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-col=
or:transparent;font-variant-numeric:normal;font-variant-east-asian:normal;v=
ertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=3D"line-height=
:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;backg=
round-color:transparent;font-variant-numeric:normal;font-variant-east-asian=
:normal;vertical-align:baseline;white-space:pre-wrap">Total patches found: =
1432 (last week 1445)</span></p></li><li dir=3D"ltr" style=3D"list-style-ty=
pe:circle;font-size:11pt;font-family:Consolas,sans-serif;color:rgb(0,0,0);b=
ackground-color:transparent;font-variant-numeric:normal;font-variant-east-a=
sian:normal;vertical-align:baseline;white-space:pre"><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-=
size:11pt;font-family:Arial;background-color:transparent;font-variant-numer=
ic:normal;font-variant-east-asian:normal;vertical-align:baseline;white-spac=
e:pre-wrap">Patches in the Pending State: 578 (41%) [last week 586 (41%)]</=
span></p></li></ul></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial=
;color:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;=
font-variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap=
">Key Status Links for YP:</span></p><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.o=
rg/wiki/Yocto_Project_v2.8_Status" style=3D"text-decoration-line:none"><spa=
n style=3D"font-size:11pt;font-family:Consolas,sans-serif;background-color:=
transparent;font-variant-numeric:normal;font-variant-east-asian:normal;text=
-decoration-line:underline;vertical-align:baseline;white-space:pre-wrap">ht=
tps://wiki.yoctoproject.org/wiki/Yocto_Project_v2.8_Status</span></a></p><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><a=
 href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.8_Schedule" style=3D"te=
xt-decoration-line:none"><span style=3D"font-size:11pt;font-family:Consolas=
,sans-serif;background-color:transparent;font-variant-numeric:normal;font-v=
ariant-east-asian:normal;text-decoration-line:underline;vertical-align:base=
line;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Yocto_2.8_Sch=
edule</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt=
;margin-bottom:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.8=
_Features" style=3D"text-decoration-line:none"><span style=3D"font-size:11p=
t;font-family:Consolas,sans-serif;background-color:transparent;font-variant=
-numeric:normal;font-variant-east-asian:normal;text-decoration-line:underli=
ne;vertical-align:baseline;white-space:pre-wrap">https://wiki.yoctoproject.=
org/wiki/Yocto_2.8_Features</span></a></p><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt=
;font-family:Arial;color:rgb(0,0,0);background-color:transparent;font-varia=
nt-numeric:normal;font-variant-east-asian:normal;vertical-align:baseline;wh=
ite-space:pre-wrap">The Yocto Project=E2=80=99s technical governance is thr=
ough its Technical Steering Committee, more information is available at:</s=
pan></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt"><a href=3D"https://wiki.yoctoproject.org/wiki/TSC" style=3D"text-de=
coration-line:none"><span style=3D"font-size:11pt;font-family:Arial;backgro=
und-color:transparent;font-variant-numeric:normal;font-variant-east-asian:n=
ormal;text-decoration-line:underline;vertical-align:baseline;white-space:pr=
e-wrap">https://wiki.yoctoproject.org/wiki/TSC</span></a></p><br><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt"><span styl=
e=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);background-color:tra=
nsparent;font-variant-numeric:normal;font-variant-east-asian:normal;vertica=
l-align:baseline;white-space:pre-wrap">The Status reports are now stored on=
 the wiki at: </span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_S=
tatus" style=3D"text-decoration-line:none"><span style=3D"font-size:11pt;fo=
nt-family:Arial;background-color:transparent;font-variant-numeric:normal;fo=
nt-variant-east-asian:normal;text-decoration-line:underline;vertical-align:=
baseline;white-space:pre-wrap">https://wiki.yoctoproject.org/wiki/Weekly_St=
atus</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:Arial;colo=
r:rgb(0,0,0);background-color:transparent;font-variant-numeric:normal;font-=
variant-east-asian:normal;vertical-align:baseline;white-space:pre-wrap">[If=
 anyone has suggestions for other information you=E2=80=99d like to see on =
this weekly status update, let us know!]</span></p></span><div><br></div><d=
iv dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><p class=3D"MsoNormal" style=3D"bac=
kground-image:initial;background-position:initial;background-repeat:initial=
"><span style=3D"font-size:12pt;font-family:Arial,sans-serif">Thanks,<span>=
</span></span></p>

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

--0000000000000e9e4d059581009b--
