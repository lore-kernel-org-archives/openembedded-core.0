Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF8CD7822B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 01:53:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8M1r3Da022583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Sep 2017 18:53:03 -0700 (PDT)
Received: from ALA-MBC.corp.ad.wrs.com ([169.254.1.180]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0361.001;
	Thu, 21 Sep 2017 18:53:03 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: AUTOREV, tags...
Thread-Index: AdMzRS/cU3YRROzMSqu1TcfmMHhuWQ==
Date: Fri, 22 Sep 2017 01:53:02 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF42017C@ALA-MBC.corp.ad.wrs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.117.129]
MIME-Version: 1.0
Subject: AUTOREV, tags...
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
X-List-Received-Date: Fri, 22 Sep 2017 01:53:03 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_007BD92917A2324FA403BCF9A464CF84CF42017CALAMBCcorpadwrs_"

--_000_007BD92917A2324FA403BCF9A464CF84CF42017CALAMBCcorpadwrs_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I think it would be nicer if recipes that currently require network access =
to check repo version info warned, but did not fail to parse.  I actually t=
hink that allowing AUTOREV at all should be conditional, because it subvert=
s reproducible builds.  I'd also guess that if tags change that is not a go=
od sign, so is it really good to check for that?

Joe


--_000_007BD92917A2324FA403BCF9A464CF84CF42017CALAMBCcorpadwrs_
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
10pt;">I think it would be nicer if recipes that currently require network =
access to check repo version info warned, but did not fail to parse. &nbsp;=
I actually think that allowing AUTOREV
 at all should be conditional, because it subverts reproducible builds. &nb=
sp;I'd also guess that if tags change that is not a good sign, so is it rea=
lly good to check for that?
<div><br>
</div>
<div>Joe</div>
<div><br>
</div>
</div>
</body>
</html>

--_000_007BD92917A2324FA403BCF9A464CF84CF42017CALAMBCcorpadwrs_--
