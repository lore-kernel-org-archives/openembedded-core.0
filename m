Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D8E77D07D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 01:43:23 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4H1h4l3014595
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 18:43:14 -0700
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.163]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0439.000;
	Thu, 16 May 2019 18:42:42 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: sysstat and sysvinit
Thread-Index: AdUMUSF2jR8ZzBXGQsi5b+sTMk6Odw==
Date: Fri, 17 May 2019 01:42:41 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84F37A4344@ALA-MBD.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.172]
MIME-Version: 1.0
Subject: sysstat and sysvinit
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
X-List-Received-Date: Fri, 17 May 2019 01:43:24 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF84F37A4344ALAMBDcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF84F37A4344ALAMBDcorpadwrs_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Although the exact issues have changed over releases, I think that sysstat =
has dependencies on host /etc files or directories when using sysvinit inst=
ead of systemd.   Since any "fixes" would potentially change target behavio=
r, what are we looking for?

Joe

--_000_007BD92917A2324FA403BCF9A464CF84F37A4344ALAMBDcorpadwrs_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" id=3D"owaParaStyle"></style>
</head>
<body fpstyle=3D"1" ocsi=3D"0">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Although the exact issues have changed over releases, I think that s=
ysstat has dependencies on host /etc files or directories when using sysvin=
it instead of systemd. &nbsp; Since any
 &quot;fixes&quot; would potentially change target behavior, what are we lo=
oking for?
<div><br>
</div>
<div>Joe</div>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF84F37A4344ALAMBDcorpadwrs_--
