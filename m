Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1T51Lr-0006m0-Sc
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 23:23:36 +0200
Received: from mail26-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE012.bigfish.com (10.43.70.62) with Microsoft SMTP Server id
	14.1.225.23; Fri, 24 Aug 2012 20:56:19 +0000
Received: from mail26-ch1 (localhost [127.0.0.1])	by mail26-ch1-R.bigfish.com
	(Postfix) with ESMTP id D1D604A00A2;
	Fri, 24 Aug 2012 20:56:19 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -1
X-BigFish: VS-1(zz98dI9371Izz1202hzzz2dh2a8h668h839h8e2h8e3hd25hf0ah107ah10d2hbe9i1155h)
Received: from mail26-ch1 (localhost.localdomain [127.0.0.1]) by mail26-ch1
	(MessageSwitch) id 1345841777116314_10853;
	Fri, 24 Aug 2012 20:56:17 +0000 (UTC)
Received: from CH1EHSMHS016.bigfish.com (snatpool2.int.messaging.microsoft.com
	[10.43.68.234])	by mail26-ch1.bigfish.com (Postfix) with ESMTP id
	114E8160042;	Fri, 24 Aug 2012 20:56:17 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS016.bigfish.com
	(10.43.70.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 24 Aug 2012 20:56:15 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.3]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.02.0309.003; Fri, 24 Aug 2012 15:56:14 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Thread-Topic: [OE-core] [PATCH] distutils/steuptools: Fix files layout and
	unbreak builds
Thread-Index: AQHNgjnTtVaeUjBwbUKK0mk83LuX75dpw7oAgAABTgA=
Date: Fri, 24 Aug 2012 20:56:13 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A6171F1@039-SN1MPN1-001.039d.mgd.msft.net>
References: <1345824924.14369.82.camel@ted>
	<70CC66F5C30A414DADDA6973E4CA391A617135@039-SN1MPN1-001.039d.mgd.msft.net>
	<CAK18fxFatWwJMUVSeQbfx18V8xsi=R0imd7zR15DWwfinEc8Ug@mail.gmail.com>
In-Reply-To: <CAK18fxFatWwJMUVSeQbfx18V8xsi=R0imd7zR15DWwfinEc8Ug@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distutils/steuptools: Fix files layout and unbreak builds
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: McClintock Matthew-B29882 <B29882@freescale.com>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Aug 2012 21:23:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <95B3708CD9CAAA4EB8D1DE8441BBBBC3@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 24, 2012 at 3:51 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> Exactly my fix. Please merge.

It's already been merged.

-M=



