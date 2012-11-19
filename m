Received: from tx2ehsobe002.messaging.microsoft.com ([65.55.88.12]
	helo=tx2outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1TaWBU-00083E-UN
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Nov 2012 19:35:14 +0100
Received: from mail111-tx2-R.bigfish.com (10.9.14.239) by
	TX2EHSOBE008.bigfish.com (10.9.40.28) with Microsoft SMTP Server id
	14.1.225.23; Mon, 19 Nov 2012 18:21:01 +0000
Received: from mail111-tx2 (localhost [127.0.0.1])	by
	mail111-tx2-R.bigfish.com (Postfix) with ESMTP id 9787A180237;
	Mon, 19 Nov 2012 18:21:01 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 1
X-BigFish: VS1(zzbb2dI98dI9371I1432Izz1de0h1202h1d1ah1d2ahzz17326ah8275bh8275dhz2dh2a8h668h839h8e2h8e3hd25hf0ah10d2h1288h12a5h12a9h12bdh137ah13b6h1441h1537h153bh162dh1631hbe9i15d0l1155h)
Received: from mail111-tx2 (localhost.localdomain [127.0.0.1]) by mail111-tx2
	(MessageSwitch) id 1353349238980032_7505;
	Mon, 19 Nov 2012 18:20:38 +0000 (UTC)
Received: from TX2EHSMHS001.bigfish.com (unknown [10.9.14.238])	by
	mail111-tx2.bigfish.com (Postfix) with ESMTP id C77DB8013A;
	Mon, 19 Nov 2012 18:20:36 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by TX2EHSMHS001.bigfish.com
	(10.9.99.101) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 19 Nov 2012 18:20:36 +0000
Received: from 039-SN1MPN1-001.039d.mgd.msft.net ([169.254.1.103]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.02.0318.003; Mon, 19 Nov 2012 18:20:36 +0000
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Leon Woestenberg <sidebranch.openembedded@gmail.com>
Thread-Topic: [yocto] [OE-core] meta-freescale general mailing list
Thread-Index: AQHNxlaQXFNguGe5MkaAKeNcvNYg2JfxeFuA
Date: Mon, 19 Nov 2012 18:20:35 +0000
Message-ID: <70CC66F5C30A414DADDA6973E4CA391A7951DE@039-SN1MPN1-001.039d.mgd.msft.net>
References: <70CC66F5C30A414DADDA6973E4CA391A780B30@039-SN1MPN1-001.039d.mgd.msft.net>
	<50A50BE1.2030305@balister.org>
	<CAP9ODKoT=n2Uxee7Weuh65OJ3ODat1pfnPmOAa0TxM05QLmB6Q@mail.gmail.com>
	<CAP9ODKqKvxEwDeoTeYZ3WogzZHbMMo8X9v9MLqqDk0e2xDOKmA@mail.gmail.com>
	<CAMvUbCwwJ+Y9B8V4GwnA2BVqzBiEhm_bePkA4Y+OXL3vfpwLtQ@mail.gmail.com>
In-Reply-To: <CAMvUbCwwJ+Y9B8V4GwnA2BVqzBiEhm_bePkA4Y+OXL3vfpwLtQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [70.112.201.132]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] meta-freescale general mailing list
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
X-List-Received-Date: Mon, 19 Nov 2012 18:35:24 -0000
X-List-Received-Date: Mon, 19 Nov 2012 18:35:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <1DEE53BAF40AC9489EEA7CE386020894@mgd.freescale.com>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 19, 2012 at 7:05 AM, Leon Woestenberg
<sidebranch.openembedded@gmail.com> wrote:
> Hello Otavio, all,
>
> On Sun, Nov 18, 2012 at 9:00 PM, Otavio Salvador <otavio@ossystems.com.br=
>
> wrote:
>>
>>
>> On Thu, Nov 15, 2012 at 3:02 PM, Otavio Salvador <otavio@ossystems.com.b=
r>
>> wrote:
>>>
>>>
>>> On Thu, Nov 15, 2012 at 1:36 PM, Philip Balister <philip@balister.org>
>>> wrote:
>>>>
>>>> On 11/14/2012 11:58 AM, McClintock Matthew-B29882 wrote:
>>>> Do we have a standard for yocto/OE list names on gmane?
>>>
>>> I tried to add it but it did not work.
>>
>> It is now done.
>>
>> You can see it at
>> http://blog.gmane.org/gmane.linux.embedded.yocto.meta-freescale
>> Regards,
>> Otavio
>
>
> Thanks. There is a small typo in the gmane: Leyers vs Layers.
>
> -Freescale OpenEmbedded/Yocto Leyers discussion list ()
> +Freescale OpenEmbedded/Yocto Layers discussion list ()

I've sent a request to fix this.

-M=



