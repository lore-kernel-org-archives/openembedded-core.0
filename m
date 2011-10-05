Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RBZoD-0002Rj-Jd
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 00:19:25 +0200
Received: from mail53-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE002.bigfish.com (10.43.70.52) with Microsoft SMTP Server id
	14.1.225.22; Wed, 5 Oct 2011 22:13:50 +0000
Received: from mail53-ch1 (localhost.localdomain [127.0.0.1])	by
	mail53-ch1-R.bigfish.com (Postfix) with ESMTP id D0269740421	for
	<openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 22:13:49 +0000 (UTC)
X-SpamScore: -15
X-BigFish: VS-15(zzbb2dK9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail53-ch1 (localhost.localdomain [127.0.0.1]) by mail53-ch1
	(MessageSwitch) id 1317852827782100_17721;
	Wed,  5 Oct 2011 22:13:47 +0000 (UTC)
Received: from CH1EHSMHS011.bigfish.com (snatpool1.int.messaging.microsoft.com
	[10.43.68.241])	by mail53-ch1.bigfish.com (Postfix) with ESMTP id
	B23C7DE8052 for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Oct 2011 22:13:47 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS011.bigfish.com
	(10.43.70.11) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Wed, 5 Oct 2011 22:13:47 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0323.007; Wed, 5 Oct 2011 17:13:46 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH v2 1/6] Fix mdadm for powerpc64
Thread-Index: AQHMg6wNWNf59z4fNk20NqvShekmSw==
Date: Wed, 5 Oct 2011 22:13:46 +0000
Message-ID: <CAEsOVNcMYeYiKrsF93OstcmEwXCPw9rmtQkS50TTaHcA5m+Uxg@mail.gmail.com>
References: <1317850009-7714-1-git-send-email-msm@freescale.com>
	<4E8CD4A9.5020802@gmail.com>
In-Reply-To: <4E8CD4A9.5020802@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH v2 1/6] Fix mdadm for powerpc64
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
X-List-Received-Date: Wed, 05 Oct 2011 22:19:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <10E14CC06B10D846B333C37DF33A8AC4@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 5, 2011 at 5:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On 10/5/2011 2:26 PM, Matthew McClintock wrote:
>>
>> This takes an upstream fix for compiling on powerpc64
>
> where is the patch ? Did you forget git add

Ugh yes, resent.

-M=



