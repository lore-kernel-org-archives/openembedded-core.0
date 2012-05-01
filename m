Received: from va3ehsobe001.messaging.microsoft.com ([216.32.180.11]
	helo=va3outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1SPKsY-0000CV-Cy
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 23:45:02 +0200
Received: from mail140-va3-R.bigfish.com (10.7.14.252) by
	VA3EHSOBE005.bigfish.com (10.7.40.25) with Microsoft SMTP Server id
	14.1.225.23; Tue, 1 May 2012 21:20:05 +0000
Received: from mail140-va3 (localhost [127.0.0.1])	by
	mail140-va3-R.bigfish.com (Postfix) with ESMTP id 91DBBC00E2	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2012 21:20:04 +0000 (UTC)
X-SpamScore: -9
X-BigFish: VS-9(zz9371I1432N98dKzz1202hzz8275bh8275dhz2dh2a8h668h839h8e2h8e3hbe9i)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail140-va3 (localhost.localdomain [127.0.0.1]) by mail140-va3
	(MessageSwitch) id 1335907203404536_17287;
	Tue,  1 May 2012 21:20:03 +0000 (UTC)
Received: from VA3EHSMHS032.bigfish.com (unknown [10.7.14.253])	by
	mail140-va3.bigfish.com (Postfix) with ESMTP id 4EEB5160086	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2012 21:20:03 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS032.bigfish.com
	(10.7.99.42) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 1 May 2012 21:20:01 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.132]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0355.003; Tue, 1 May 2012 16:20:07 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Bug 1570 - ICU not endian safe and web2 fails on ppc
Thread-Index: AQHNGPa+tt3LMEkuTUWQjWDsOCrv75a14iUA
Date: Tue, 1 May 2012 21:20:06 +0000
Message-ID: <CAEsOVNdJJ8ooSajaQ_DRkhKs_kLKa5Y489+B+W4=qnTOmiReoA@mail.gmail.com>
References: <alpine.DEB.2.02.1203240515560.21886@oneiric>
	<1332584294.9740.506.camel@ted>
	<alpine.DEB.2.02.1203240621540.25240@oneiric>
	<CAEsOVNdOp6GVeGusJXit2xocy-V7a7nzejTpo3aKT9y9-sxtjA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0305E4EB@fmsmsx152.amr.corp.intel.com>
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0305E4EB@fmsmsx152.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Bug 1570 - ICU not endian safe and web2 fails on ppc
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
X-List-Received-Date: Tue, 01 May 2012 21:45:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <209EE7481A710F4181199195F053B59E@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 12, 2012 at 4:53 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
> Gary,
> =A0 May be Matthew may be able to provide some help with his Freescale ba=
ckground.
>
> I could not add Matthew to the bug, so ccing him here.
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D1570

Sorry for the late reply but this issue looks resolved...

-M=



