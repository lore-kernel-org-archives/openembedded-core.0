Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
	helo=AM1EHSOBE001.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9jTK-00037J-P4
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 22:14:14 +0200
Received: from mail103-am1-R.bigfish.com (10.3.201.252) by
	AM1EHSOBE001.bigfish.com (10.3.204.21) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 20:08:45 +0000
Received: from mail103-am1 (localhost.localdomain [127.0.0.1])	by
	mail103-am1-R.bigfish.com (Postfix) with ESMTP id 1B66B9F85AA	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 20:08:45 +0000 (UTC)
X-SpamScore: -6
X-BigFish: VS-6(zz9371K98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail103-am1 (localhost.localdomain [127.0.0.1]) by mail103-am1
	(MessageSwitch) id 1317413324157864_24983;
	Fri, 30 Sep 2011 20:08:44 +0000 (UTC)
Received: from AM1EHSMHS007.bigfish.com (unknown [10.3.201.250])	by
	mail103-am1.bigfish.com (Postfix) with ESMTP id D82DB258053	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 20:08:43 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS007.bigfish.com
	(10.3.207.107) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 20:08:40 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Fri, 30 Sep 2011 15:08:38 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Adding TARGET_VECTOR
Thread-Index: AQHMf5lRsd9KAmOeJE2Xczt0K8X7D5VmrVsAgAAApQA=
Date: Fri, 30 Sep 2011 20:08:38 +0000
Message-ID: <CAEsOVNdoBF3iG_58X8y7Uf5y9-Bo52NEnyP8PQe174qNN0XzcA@mail.gmail.com>
References: <5755C992-C736-4714-9DE3-761E3E74C6F8@kernel.crashing.org>
	<4E85FCF7.6030208@gmail.com>
	<CAEsOVNcC79qr6+zp6ify_vViu-+FsiYq=XvUCyWFc924RPyqjg@mail.gmail.com>
	<CAMKF1srCrTcfy2niJNF-jkArvZHaU0P8=zH5sqMjFrs1BcKA2g@mail.gmail.com>
In-Reply-To: <CAMKF1srCrTcfy2niJNF-jkArvZHaU0P8=zH5sqMjFrs1BcKA2g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: Adding TARGET_VECTOR
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
X-List-Received-Date: Fri, 30 Sep 2011 20:14:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <F2797B6A87B71748B2ADE31D8E274E2C@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 3:05 PM, Khem Raj <raj.khem@gmail.com> wrote:
> there is SOC_FAMILY thats used predominantly in TI chips that could be
> of interest here.
> but in this case I wanted to understand
> if it is a feature of FPU or is it a separate unit, still not clear to me=
.

It's all on one SoC/Core.

-M=



