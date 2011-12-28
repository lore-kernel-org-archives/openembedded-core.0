Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RfiXy-00031a-KT
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Dec 2011 02:43:14 +0100
Received: from mail61-ch1-R.bigfish.com (10.43.68.246) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.23; Wed, 28 Dec 2011 01:35:40 +0000
Received: from mail61-ch1 (localhost [127.0.0.1])	by mail61-ch1-R.bigfish.com
	(Postfix) with ESMTP id 06F154A0134	for
	<openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 01:34:51 +0000 (UTC)
X-SpamScore: 2
X-BigFish: VS2(zz9371I98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3hbe9n61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail61-ch1 (localhost.localdomain [127.0.0.1]) by mail61-ch1
	(MessageSwitch) id 1325036090699648_6013;
	Wed, 28 Dec 2011 01:34:50 +0000 (UTC)
Received: from CH1EHSMHS021.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.252])	by mail61-ch1.bigfish.com (Postfix) with ESMTP id
	A6B201000D6 for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Dec 2011 01:34:50 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS021.bigfish.com
	(10.43.70.21) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Wed, 28 Dec 2011 01:35:39 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.86]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0355.003; Tue, 27 Dec 2011 19:35:58 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH oe-core] valgrind: add powerpc into the
	compatible host list
Thread-Index: AQHMxQEM1g9NzChUwEWpt1f5LT79qA==
Date: Wed, 28 Dec 2011 01:35:57 +0000
Message-ID: <CAEsOVNctAnsG-Jg3VETQcPLLt7+KV14ra_d81je1P4FGWWpG4g@mail.gmail.com>
References: <1324289521-10140-1-git-send-email-b19537@freescale.com>
	<C27D8181-0988-4BF7-A858-BC873D7C47F8@dominion.thruhere.net>
	<CA452391058F6D4E9715FB2C29D9312A010B915F@039-SN2MPN1-023.039d.mgd.msft.net>
	<1324297600.4568.170.camel@ted>
	<CA452391058F6D4E9715FB2C29D9312A010B9EEF@039-SN2MPN1-023.039d.mgd.msft.net>
	<1324487225.18348.11.camel@ted>
	<CAFZPMobmLhrHoPo9devpvdgw_OSWXbR0_aiLc7bp5-ce+QG0yQ@mail.gmail.com>
	<CA452391058F6D4E9715FB2C29D9312A010BBDB0@039-SN2MPN1-023.039d.mgd.msft.net>
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A010BBDB0@039-SN2MPN1-023.039d.mgd.msft.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH oe-core] valgrind: add powerpc into the compatible host list
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
X-List-Received-Date: Wed, 28 Dec 2011 01:43:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <93E6DDC81CBC764499A433059036158C@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 22, 2011 at 9:15 PM, Luo Zhenhua-B19537
<B19537@freescale.com> wrote:
> Can somebody confirm whether valgrind works for armv4/v5, please?

We should probably ask this on a valgrind list...

-M=



