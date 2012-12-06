Received: from va3ehsobe010.messaging.microsoft.com ([216.32.180.30]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B19537@freescale.com>) id 1TgYTh-0003ZF-Ct
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 11:14:51 +0100
Received: from mail107-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE010.bigfish.com (10.7.40.12) with Microsoft SMTP Server id
	14.1.225.23; Thu, 6 Dec 2012 10:00:23 +0000
Received: from mail107-va3 (localhost [127.0.0.1])	by
	mail107-va3-R.bigfish.com (Postfix) with ESMTP id 63CF8160282;
	Thu,  6 Dec 2012 10:00:23 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -2
X-BigFish: VS-2(zz9371I542I1432Izz1de0h1202h1d1ah1d2ahzz8275dhz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631hbe9i1155h)
Received: from mail107-va3 (localhost.localdomain [127.0.0.1]) by mail107-va3
	(MessageSwitch) id 1354788021434762_27972;
	Thu,  6 Dec 2012 10:00:21 +0000 (UTC)
Received: from VA3EHSMHS020.bigfish.com (unknown [10.7.14.253])	by
	mail107-va3.bigfish.com (Postfix) with ESMTP id 489552009E;
	Thu,  6 Dec 2012 10:00:21 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS020.bigfish.com
	(10.7.99.30) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Thu, 6 Dec 2012 10:00:14 +0000
Received: from 039-SN2MPN1-021.039d.mgd.msft.net ([169.254.1.190]) by
	039-SN1MMR1-004.039d.mgd.msft.net ([::1]) with mapi id 14.02.0318.003;
	Thu, 6 Dec 2012 10:00:13 +0000
From: Luo Zhenhua-B19537 <B19537@freescale.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>
Thread-Topic: Difference of toolchain recipes
Thread-Index: Ac3R0s0/UEOxKwlOQ72h3AL1xJ4hNABxX2jA
Date: Thu, 6 Dec 2012 10:00:13 +0000
Message-ID: <CA452391058F6D4E9715FB2C29D9312A0137811C@039-SN2MPN1-021.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.134]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: Difference of toolchain recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 10:14:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can anybody shed some light, please?


Best Regards,

Zhenhua


> -----Original Message-----
> From: Luo Zhenhua-B19537
> Sent: Tuesday, December 04, 2012 11:53 AM
> To: openembedded-core@lists.openembedded.org; 'yocto@yoctoproject.org'
> Subject: Difference of toolchain recipes
>=20
> It is a bit confused for the different recipes of toolchian, can somebody
> help to explain what's the difference for those recipes? E.g. gcc-cross,
> gcc-cross-canadian, gcc-cross-initial, gcc-cross-intermediate, gcc-
> crosssdk, gcc-crosssdk-initial, gcc-crosssdk-intermediate, gcc-runtime,
> etc.
>=20
> Is there any document for those description?
>=20
>=20
> Best Regards,
>=20
> Zhenhua



