Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web11.5245.1594189246255663937
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jul 2020 23:20:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 4B1q1Q0nHZzlZP8
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 08:20:42 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4B1q1P3812z2TTMy
	for <openembedded-core@lists.openembedded.org>; Wed,  8 Jul 2020 08:20:41 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.63) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 8 Jul
 2020 08:20:40 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: Patches are stuck in master-next
Date: Wed, 8 Jul 2020 08:20:34 +0200
Message-ID: <5614347.lOV4Wx5bFT@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [192.168.54.63]
X-RMX-ID: 20200708-082041-4B1q1P3812z2TTMy-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Two of my patches are in master-next since some time. Is there any reason w=
hy
they don't appear in master?

https://patchwork.openembedded.org/series/24760/#
https://patchwork.openembedded.org/series/24775/#

I would like to send further patches for meta-openembedded which
depend on the above ones.

regards
Christian



________________________________
 [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1=
.jpg] <https://microsites.arri.com/stellar/>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler
