Received: from am1ehsobe002.messaging.microsoft.com ([213.199.154.205]
	helo=AM1EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RSz7S-0002qg-0X
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 23:47:14 +0100
Received: from mail96-am1-R.bigfish.com (10.3.201.245) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.22; Tue, 22 Nov 2011 22:40:03 +0000
Received: from mail96-am1 (localhost [127.0.0.1])	by mail96-am1-R.bigfish.com
	(Postfix) with ESMTP id 18A8B5C00EA	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 22:41:08 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail96-am1 (localhost.localdomain [127.0.0.1]) by mail96-am1
	(MessageSwitch) id 132200166734754_22650;
	Tue, 22 Nov 2011 22:41:07 +0000 (UTC)
Received: from AM1EHSMHS005.bigfish.com (unknown [10.3.201.253])	by
	mail96-am1.bigfish.com (Postfix) with ESMTP id EE4D2340046	for
	<openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 22:41:06 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS005.bigfish.com
	(10.3.207.105) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Tue, 22 Nov 2011 22:40:00 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Tue, 22 Nov 2011 16:40:38 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] Remove EGLIBPARALLELISM from deps for
	EXTRA_OEMAKE
Thread-Index: AQHMqVAMFikWB5tgjUStyjwQCD1Q5ZW54VyA
Date: Tue, 22 Nov 2011 22:40:38 +0000
Message-ID: <CAEsOVNczFsQBHND1ddr-oZW=HkAqoZnVsLQimViqcJD33HjDbw@mail.gmail.com>
References: <1321568900-19406-1-git-send-email-msm@freescale.com>
	<4ECBFD16.3020406@linux.intel.com>
In-Reply-To: <4ECBFD16.3020406@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: [PATCH] Remove EGLIBPARALLELISM from deps for EXTRA_OEMAKE
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
X-List-Received-Date: Tue, 22 Nov 2011 22:47:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <D4C74833CA992E4983EF582C1F49CA94@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 22, 2011 at 1:50 PM, Saul Wold <sgw@linux.intel.com> wrote:
> When possible, please include the recipe or file you are changing as part=
 of
> the patch subject.
>
> For example this would be:
>
> eglibc.inc: Remove EGLIBPARALLELISM from deps for EXTRA_OEMAKE

Sorry. Shall I resubmit or will you handle this?

-M=



