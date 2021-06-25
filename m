Subject: Re: [dunfell][PATCH] rpm: fix CVE-2021-3421
To: openembedded-core@lists.openembedded.org
From: "Minjae Kim" <flowergom@gmail.com>
X-Originating-Location: Yongsan-gu, Seoul, KR (59.6.144.168)
X-Originating-Platform: Windows Chrome 91
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 24 Jun 2021 22:30:31 -0700
References: <cc3503555b1342edbb4ec76dc7595fcf@intel.com>
In-Reply-To: <cc3503555b1342edbb4ec76dc7595fcf@intel.com>
Message-ID: <10727.1624599031550021387@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OisBbPY1yOwyvsYBT00x"

--OisBbPY1yOwyvsYBT00x
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In order to fix CVE-2021-3421, I added RPMSIGTAG_FILESIGNATURES and RPMSIGT=
AG_FILESIGNATURELENGTH in lib/rpmtag.h.
So It is possible to build. but I cannot test on target yet.

--OisBbPY1yOwyvsYBT00x
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

In order to fix CVE-2021-3421, I added&nbsp;<span style=3D"white-space: pre=
-wrap;">RPMSIGTAG_FILESIGNATURES and </span><span style=3D"white-space: pre=
-wrap;">RPMSIGTAG_FILESIGNATURELENGTH in lib/rpmtag.h.<br />So It is possib=
le to build. but I cannot test on target yet.</span>

--OisBbPY1yOwyvsYBT00x--
