Received: from db3ehsobe003.messaging.microsoft.com ([213.199.154.141]
	helo=DB3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1R9gpo-0007WO-MO
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 19:25:17 +0200
Received: from mail12-db3-R.bigfish.com (10.3.81.243) by
	DB3EHSOBE003.bigfish.com (10.3.84.23) with Microsoft SMTP Server id
	14.1.225.22; Fri, 30 Sep 2011 17:19:47 +0000
Received: from mail12-db3 (localhost.localdomain [127.0.0.1])	by
	mail12-db3-R.bigfish.com (Postfix) with ESMTP id 25E0D1A30580	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 17:19:47 +0000 (UTC)
X-SpamScore: -16
X-BigFish: VS-16(zz9371K1432N98dK4015Lzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null);
	IPVD:NLI; H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 0,
Received: from mail12-db3 (localhost.localdomain [127.0.0.1]) by mail12-db3
	(MessageSwitch) id 1317403165468470_10968;
	Fri, 30 Sep 2011 17:19:25 +0000 (UTC)
Received: from DB3EHSMHS002.bigfish.com (unknown [10.3.81.247])	by
	mail12-db3.bigfish.com (Postfix) with ESMTP id 6A5831698052	for
	<openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 17:19:25 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by DB3EHSMHS002.bigfish.com
	(10.3.87.102) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 30 Sep 2011 17:19:23 +0000
Received: from 039-SN1MPN1-003.039d.mgd.msft.net ([169.254.3.230]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0323.007; Fri, 30 Sep 2011 12:19:21 -0500
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 07/16] Fix lttng-ust for powerpc64
Thread-Index: AQHMftSs0fOwPeJsS0ObTNCRdOxOhg==
Date: Fri, 30 Sep 2011 17:19:21 +0000
Message-ID: <CAEsOVNciHOChiA9cfkNQzpyP_BQdXdSi=GPrhqZAekKMQseZJQ@mail.gmail.com>
References: <1317270070-14250-1-git-send-email-msm@freescale.com>
	<1317270070-14250-7-git-send-email-msm@freescale.com>
	<1317311457.12332.99.camel@ted>
	<CAEsOVNd7317kDeGBNB6HLy2bpQB102piFtAMxVriX1GocaCXew@mail.gmail.com>
	<1317321967.12332.113.camel@ted> <4E85F52B.2010000@intel.com>
In-Reply-To: <4E85F52B.2010000@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH 07/16] Fix lttng-ust for powerpc64
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
X-List-Received-Date: Fri, 30 Sep 2011 17:25:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <A1A948EA40BD5840B63F1D5ED437625D@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 30, 2011 at 11:58 AM, Saul Wold <saul.wold@intel.com> wrote:
>> There is some marking for "should be upstreamed"/upstreamable.
>>
> The marking would be "Pending", this indicates that it should be attempte=
d,
> if it gets up streamed then marked Accepted with a pointer to the potenti=
al
> upstream version or ref.

Thanks, the next version was changed to Submitted as I sent a patch upstrea=
m.

-M=



