Return-Path: <sona.sarmadi@enea.com>
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6746A77654
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 09:35:47 +0000 (UTC)
Received: from 1cnirs-0006vS-UC by out11a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <sona.sarmadi@enea.com>) id 1cnirs-0006w2-Uq
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Mar 2017 02:35:48 -0700
Received: by emcmailer; Tue, 14 Mar 2017 02:35:48 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11a.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <sona.sarmadi@enea.com>)
	id 1cnirs-0006vS-UC for openembedded-core@lists.openembedded.org;
	Tue, 14 Mar 2017 02:35:48 -0700
Received: from SESTOEX04.enea.se ([fe80::bc2d:9299:d6b2:d0b7]) by
	SESTOEX08.enea.se ([fe80::1c3:4003:dc47:23c0%11]) with mapi id
	14.03.0319.002; Tue, 14 Mar 2017 10:35:48 +0100
From: Sona Sarmadi <sona.sarmadi@enea.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Use-SHA256-not-MD5-as-default-digest.patch file is not added
	to the openssl_1.0.2k.bb
Thread-Index: AdKcpWugpeUOZ+DTR5OcRUMJIKmQjA==
Date: Tue, 14 Mar 2017 09:35:47 +0000
Message-ID: <3230301C09DEF9499B442BBE162C5E48AC3351D9@SESTOEX04.enea.se>
Accept-Language: sv-SE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.142.231]
MIME-Version: 1.0
X-Outbound-IP: 192.36.1.72
X-Env-From: sona.sarmadi@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: Use-SHA256-not-MD5-as-default-digest.patch file is not added to the openssl_1.0.2k.bb
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
X-List-Received-Date: Tue, 14 Mar 2017 09:35:48 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_3230301C09DEF9499B442BBE162C5E48AC3351D9SESTOEX04enease_"

--_000_3230301C09DEF9499B442BBE162C5E48AC3351D9SESTOEX04enease_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi guys,

Does anyone know why "Use-SHA256-not-MD5-as-default-digest.patch" is in the=
 openssl directory but has not been added to the openssl recipes? (both in =
master and morty branches):

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivi=
ty/openssl/openssl
Use-SHA256-not-MD5-as-default-digest.patch

But this file is not added to the recipes:
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivi=
ty/openssl/openssl_1.0.2k.bb

http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivi=
ty/openssl/openssl_1.0.2j.bb?h=3Dmorty

Thanks
//Sona




--_000_3230301C09DEF9499B442BBE162C5E48AC3351D9SESTOEX04enease_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from rtf -->
<style><!-- .EmailQuote { margin-left: 1pt; padding-left: 4pt; border-left:=
 #800000 2px solid; } --></style>
</head>
<body>
<font face=3D"Calibri" size=3D"2"><span style=3D"font-size:11pt;">
<div>Hi guys,</div>
<div>&nbsp;</div>
<div>Does anyone know why &#8220;Use-SHA256-not-MD5-as-default-digest.patch=
&#8221; is in the openssl directory but has not been added to the openssl r=
ecipes? (both in master and morty branches):</div>
<div>&nbsp;</div>
<div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/re=
cipes-connectivity/openssl/openssl"><font color=3D"#0563C1"><u>http://git.y=
octoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivity/openssl/o=
penssl</u></font></a></div>
<div>Use-SHA256-not-MD5-as-default-digest.patch</div>
<div>&nbsp;</div>
<div>But this file is not added to the recipes:</div>
<div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/re=
cipes-connectivity/openssl/openssl_1.0.2k.bb"><font color=3D"#0563C1"><u>ht=
tp://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-connectivity=
/openssl/openssl_1.0.2k.bb</u></font></a></div>
<div>&nbsp;</div>
<div><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/re=
cipes-connectivity/openssl/openssl_1.0.2j.bb?h=3Dmorty"><font color=3D"#056=
3C1"><u>http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-co=
nnectivity/openssl/openssl_1.0.2j.bb?h=3Dmorty</u></font></a></div>
<div>&nbsp;</div>
<div>Thanks</div>
<div>//Sona</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>&nbsp;</div>
</span></font>
</body>
</html>

--_000_3230301C09DEF9499B442BBE162C5E48AC3351D9SESTOEX04enease_--
