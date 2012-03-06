Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1S53pi-0003OS-5b
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 00:30:18 +0100
Received: from mail162-tx2-R.bigfish.com (10.9.14.243) by
	TX2EHSOBE003.bigfish.com (10.9.40.23) with Microsoft SMTP Server id
	14.1.225.23; Tue, 6 Mar 2012 23:21:40 +0000
Received: from mail162-tx2 (localhost [127.0.0.1])	by
	mail162-tx2-R.bigfish.com (Postfix) with ESMTP id BAE09220593;
	Tue,  6 Mar 2012 23:21:40 +0000 (UTC)
X-SpamScore: -1
X-BigFish: VS-1(zz9371I98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9k)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail162-tx2 (localhost.localdomain [127.0.0.1]) by mail162-tx2
	(MessageSwitch) id 1331076099356628_11658;
	Tue,  6 Mar 2012 23:21:39 +0000 (UTC)
Received: from TX2EHSMHS009.bigfish.com (unknown [10.9.14.252])	by
	mail162-tx2.bigfish.com (Postfix) with ESMTP id 4662D4A0045;
	Tue,  6 Mar 2012 23:21:39 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS009.bigfish.com
	(10.9.99.109) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 6 Mar 2012 23:21:39 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.244]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Tue, 6 Mar 2012 17:21:38 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "Eibach, Dirk" <Eibach@gdsys.de>
Thread-Topic: Build for powerpc spe broken
Thread-Index: Acz4V8dvGE2kPzXtTAeK/7rTL2tQTgAaMT4AANhkjwA=
Date: Tue, 6 Mar 2012 23:21:38 +0000
Message-ID: <CAEsOVNdnLh878RpD8AmmKa5xGZ7cPaz7MO34-Dwnfx2wS6x-Eg@mail.gmail.com>
References: <48D3D52125C49B43AE880038E2E5314BB5BFA1@SRV101.gdsys.de>
	<CAEsOVNeLGkbq9P+qiKW0PtxJUBJtjbk0YJbdWzjoNEb9bVyvfQ@mail.gmail.com>
In-Reply-To: <CAEsOVNeLGkbq9P+qiKW0PtxJUBJtjbk0YJbdWzjoNEb9bVyvfQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Build for powerpc spe broken
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 23:30:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <21A960F12F474849AB335CF3FD5A81A2@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 2, 2012 at 10:05 AM, Matthew McClintock <msm@freescale.com> wro=
te:
> I did not think this would break anything - can you share what's going
> on? I'm on vacation now and can't test the replacement for 3/4 yet -
> but I will look at this as soon as Tuesday.

I've sent another patch - can you test and see if this fixes your issue?

-M=



