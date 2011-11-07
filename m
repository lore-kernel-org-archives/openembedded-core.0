Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RNVj9-00028V-2N
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 21:23:31 +0100
Received: from mail100-ch1-R.bigfish.com (10.43.68.245) by
	CH1EHSOBE017.bigfish.com (10.43.70.67) with Microsoft SMTP Server id
	14.1.225.22; Mon, 7 Nov 2011 20:16:55 +0000
Received: from mail100-ch1 (localhost.localdomain [127.0.0.1])	by
	mail100-ch1-R.bigfish.com (Postfix) with ESMTP id 2E4EB147033C	for
	<openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 20:17:07 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275dhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,13,
Received: from mail100-ch1 (localhost.localdomain [127.0.0.1]) by mail100-ch1
	(MessageSwitch) id 1320697000995005_13019;
	Mon,  7 Nov 2011 20:16:40 +0000 (UTC)
Received: from CH1EHSMHS031.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.250])	by mail100-ch1.bigfish.com (Postfix) with ESMTP id
	F04A916804B	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2011 20:16:40 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS031.bigfish.com
	(10.43.70.31) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 7 Nov 2011 20:16:49 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.150]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Mon, 7 Nov 2011 14:16:48 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 14/28] Add new IMAGE_CLASSES
	variable for classes for image generation
Thread-Index: AQHMnYotftQ28TtjPUeYcnXpxaGVLw==
Date: Mon, 7 Nov 2011 20:16:47 +0000
Message-ID: <CAEsOVNfsoM_JR7xX6aR0V801=hmbWRca0oXVH94p6uY2b0b4Og@mail.gmail.com>
References: <cover.1320513631.git.sgw@linux.intel.com>
	<8e793bb4092c80baf441a33f348852bfbd4a4420.1320513631.git.sgw@linux.intel.com>
	<1320674653.23708.11.camel@ted>
In-Reply-To: <1320674653.23708.11.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [CONSOLIDATED PULL 14/28] Add new IMAGE_CLASSES variable for classes for image generation
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
X-List-Received-Date: Mon, 07 Nov 2011 20:23:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F11AF3735A6BCF468A351CEED431FF41@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 7, 2011 at 8:04 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Most initial new users don't need to see this. Can we place this into
> local.conf.sample.extended please?

Follow up patch sent on other thread.

-M=



