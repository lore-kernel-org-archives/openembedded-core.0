Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <92a4fffe519163beaec42919fb04554d1ca30a5e.camel@linuxfoundation.org>
Subject: Yocto Project Status WW18`22
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
Date: Tue, 03 May 2022 15:18:28 +0100
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-8wCTsaDV+9sFbT8z5Zbp"
List-id: <openembedded-core.lists.openembedded.org>
To: yocto@lists.yoctoproject.org, openembedded-core@lists.openembedded.org

--=-8wCTsaDV+9sFbT8z5Zbp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 4.1 M1
Next Deadline: 30th May 2022 YP 4.1 M1 Build

Next Team Meetings:
Yocto Project Summit - 17th-19th May
(https://www.yoctoproject.org/yocto-project-summit-2022-05/)
Bug Triage meeting Thursday May 5th 7:30 am PDT
(https://zoom.us/j/454367603?pwd=ZGxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09)
Monthly Project Meeting Tuesday May 3rd at 8 am PDT
(https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
Weekly Engineering Sync Tuesday May 10th at 8 am PDT
(https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09)
Twitch - See https://www.twitch.tv/theyoctojester

Key Status/Updates:
YP 4.0 was released, thanks to everyone who contributed to it!
YP 3.3.6 was released
YP 3.1.16 is due for release and has TSC approval
YP 3.4.4 is due to build this week
Master has started taking new patches but we have struggled with issues on a
number of autobuilder workers and the cluster was down on capacity as a result.
If people see intermittent issues in their own builds, particularly if they’re
the same as intermittent issues seen on the autobuilder, please do comment in
the bugs mentioning when they happen as the frequency information does help us
prioritize fixing the most common issues.
Intermittent issues continue to be at high levels and help is very much welcome
in trying to resolve them. You can see the list of failures we’re continuing to
see by searching for the “AB-INT” tag in bugzilla:
https://bugzilla.yoctoproject.org/buglist.cgi?quicksearch=AB-INT

Ways to contribute:
There are bugs identified as possible for newcomers to the project:
https://wiki.yoctoproject.org/wiki/Newcomers
There are bugs that are currently unassigned for YP 3.5. See:
https://wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.5_Unassigned_Enhancements.2FBugs
We’d welcome new maintainers for recipes in OE-Core. Please see the list at:
http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc
and discuss with the existing maintainer, or ask on the OE-Core mailing list. We
will likely move a chunk of these to “Unassigned” soon to help facilitate this.
Help us resolve CVE issues: CVE metrics 

YP 4.1 Milestone Dates:
YP 4.1 M1 build date 2022/05/30
YP 4.1 M1 Release date 2022/06/10
YP 4.1 M2 build date 2022/07/11
YP 4.1 M2 Release date 2022/07/22
YP 4.1 M3 build date 2022/08/22
YP 4.1 M3 Release date 2022/09/02
YP 4.1 M4 build date 2022/10/03
YP 4.1 M4 Release date 2022/10/28

Upcoming dot releases:
YP 3.3.6 is released.
YP 3.1.16 out of QA
YP 3.4.4 build date 2022/05/02
YP 3.4.4 Release date 2022/05/13
YP 4.0.1 build date 2022/05/16
YP 4.0.1 Release date 2022/05/27
YP 3.1.17 build date 2022/06/06
YP 3.1.17 Release date 2022/06/17
YP 4.0.2 build date 2022/06/27
YP 4.0.2 Release date 2022/07/08
YP 3.1.18 build date 2022/07/18
YP 3.1.18 Release date 2022/07/29
YP 4.0.3 build date 2022/08/08
YP 4.0.3 Release date 2022/08/19
YP 3.1.19 build date 2022/08/29
YP 3.1.19 Release date 2022/09/09
YP 4.0.4 build date 2022/09/19
YP 4.0.4 Release date 2022/09/30
YP 3.1.20 build date 2022/10/10
YP 3.1.20 Release date 2022/10/21
YP 4.0.5 build date 2022/10/31
YP 4.0.5 Release date 2022/11/11

Tracking Metrics:
WDD 2450 (last week 2495) (https://wiki.yoctoproject.org/charts/combo.html)
OE-Core/Poky Patch Metrics
Total patches found: 1205 (last week 1215)
Patches in the Pending State: 341 (28%) [last week 343 (28%)]

The Yocto Project’s technical governance is through its Technical Steering
Committee, more information is available at:
https://wiki.yoctoproject.org/wiki/TSC

The Status reports are now stored on the wiki at:
https://wiki.yoctoproject.org/wiki/Weekly_Status

[If anyone has suggestions for other information you’d like to see on this
weekly status update, let us know!]


--=-8wCTsaDV+9sFbT8z5Zbp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>Current Dev Position: YP 4.1 M1</div><div>Nex=
t Deadline: 30th May 2022 YP 4.1 M1 Build</div><div><br></div><div>Next Tea=
m Meetings:</div><div>Yocto Project Summit - 17th-19th May (<a href=3D"http=
s://www.yoctoproject.org/yocto-project-summit-2022-05/">https://www.yoctopr=
oject.org/yocto-project-summit-2022-05/</a>)</div><div>Bug Triage meeting T=
hursday May 5th 7:30 am PDT (<a href=3D"https://zoom.us/j/454367603?pwd=3DZ=
Gxoa2ZXL3FkM3Y0bFd5aVpHVVZ6dz09">https://zoom.us/j/454367603?pwd=3DZGxoa2ZX=
L3FkM3Y0bFd5aVpHVVZ6dz09</a>)</div><div>Monthly Project Meeting Tuesday May=
 3rd at 8 am PDT (<a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6=
ck81bkcrYjRrcmJsUT09">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkc=
rYjRrcmJsUT09</a>)</div><div>Weekly Engineering Sync Tuesday May 10th  at 8=
 am PDT (<a href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrY=
jRrcmJsUT09">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJs=
UT09</a>)</div><div>Twitch -  See <a href=3D"https://www.twitch.tv/theyocto=
jester">https://www.twitch.tv/theyoctojester</a></div><div><br></div><div>K=
ey Status/Updates:</div><div>YP 4.0 was released, thanks to everyone who co=
ntributed to it!</div><div>YP 3.3.6 was released</div><div>YP 3.1.16 is due=
 for release and has TSC approval</div><div>YP 3.4.4 is due to build this w=
eek</div><div>Master has started taking new patches but we have struggled w=
ith issues on a number of autobuilder workers and the cluster was down on c=
apacity as a result.</div><div>If people see intermittent issues in their o=
wn builds, particularly if they=E2=80=99re the same as intermittent issues =
seen on the autobuilder, please do comment in the bugs mentioning when they=
 happen as the frequency information does help us prioritize fixing the mos=
t common issues.</div><div>Intermittent issues continue to be at high level=
s and help is very much welcome in trying to resolve them. You can see the =
list of failures we=E2=80=99re continuing to see by searching for the =E2=
=80=9CAB-INT=E2=80=9D tag in bugzilla: <a href=3D"https://bugzilla.yoctopro=
ject.org/buglist.cgi?quicksearch=3DAB-INT">https://bugzilla.yoctoproject.or=
g/buglist.cgi?quicksearch=3DAB-INT</a></div><div><br></div><div>Ways to con=
tribute:</div><div>There are bugs identified as possible for newcomers to t=
he project: <a href=3D"https://wiki.yoctoproject.org/wiki/Newcomers">https:=
//wiki.yoctoproject.org/wiki/Newcomers</a></div><div>There are bugs that ar=
e currently unassigned for YP 3.5. See: <a href=3D"https://wiki.yoctoprojec=
t.org/wiki/Bug_Triage#Medium.2B_3.5_Unassigned_Enhancements.2FBugs">https:/=
/wiki.yoctoproject.org/wiki/Bug_Triage#Medium.2B_3.5_Unassigned_Enhancement=
s.2FBugs</a></div><div>We=E2=80=99d welcome new maintainers for recipes in =
OE-Core. Please see the list at: <a href=3D"http://git.yoctoproject.org/cgi=
t.cgi/poky/tree/meta/conf/distro/include/maintainers.inc">http://git.yoctop=
roject.org/cgit.cgi/poky/tree/meta/conf/distro/include/maintainers.inc</a> =
and discuss with the existing maintainer, or ask on the OE-Core mailing lis=
t. We will likely move a chunk of these to =E2=80=9CUnassigned=E2=80=9D soo=
n to help facilitate this.</div><div>Help us resolve CVE issues: CVE metric=
s </div><div><br></div><div>YP 4.1 Milestone Dates:</div><div>YP 4.1 M1 bui=
ld date 2022/05/30</div><div>YP 4.1 M1 Release date 2022/06/10</div><div>YP=
 4.1 M2 build date 2022/07/11</div><div>YP 4.1 M2 Release date 2022/07/22</=
div><div>YP 4.1 M3 build date 2022/08/22</div><div>YP 4.1 M3 Release date 2=
022/09/02</div><div>YP 4.1 M4 build date 2022/10/03</div><div>YP 4.1 M4 Rel=
ease date 2022/10/28</div><div><br></div><div>Upcoming dot releases:</div><=
div>YP 3.3.6 is released.</div><div>YP 3.1.16 out of QA</div><div>YP 3.4.4 =
build date 2022/05/02</div><div>YP 3.4.4 Release date 2022/05/13</div><div>=
YP 4.0.1 build date 2022/05/16</div><div>YP 4.0.1 Release date 2022/05/27</=
div><div>YP 3.1.17 build date 2022/06/06</div><div>YP 3.1.17 Release date 2=
022/06/17</div><div>YP 4.0.2 build date 2022/06/27</div><div>YP 4.0.2 Relea=
se date 2022/07/08</div><div>YP 3.1.18 build date 2022/07/18</div><div>YP 3=
.1.18 Release date 2022/07/29</div><div>YP 4.0.3 build date 2022/08/08</div=
><div>YP 4.0.3 Release date 2022/08/19</div><div>YP 3.1.19 build date 2022/=
08/29</div><div>YP 3.1.19 Release date 2022/09/09</div><div>YP 4.0.4 build =
date 2022/09/19</div><div>YP 4.0.4 Release date 2022/09/30</div><div>YP 3.1=
.20 build date 2022/10/10</div><div>YP 3.1.20 Release date 2022/10/21</div>=
<div>YP 4.0.5 build date 2022/10/31</div><div>YP 4.0.5 Release date 2022/11=
/11</div><div><br></div><div>Tracking Metrics:</div><div>WDD 2450 (last wee=
k 2495) (<a href=3D"https://wiki.yoctoproject.org/charts/combo.html">https:=
//wiki.yoctoproject.org/charts/combo.html</a>)</div><div>OE-Core/Poky Patch=
 Metrics</div><div>Total patches found: 1205 (last week 1215)</div><div>Pat=
ches in the Pending State: 341 (28%) [last week 343 (28%)]</div><div><br></=
div><div>The Yocto Project=E2=80=99s technical governance is through its Te=
chnical Steering Committee, more information is available at:</div><div><a =
href=3D"https://wiki.yoctoproject.org/wiki/TSC">https://wiki.yoctoproject.o=
rg/wiki/TSC</a></div><div><br></div><div>The Status reports are now stored =
on the wiki at: <a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status=
">https://wiki.yoctoproject.org/wiki/Weekly_Status</a></div><div><br></div>=
<div>[If anyone has suggestions for other information you=E2=80=99d like to=
 see on this weekly status update, let us know!]</div><div><br></div><div><=
span></span></div></body></html>

--=-8wCTsaDV+9sFbT8z5Zbp--
