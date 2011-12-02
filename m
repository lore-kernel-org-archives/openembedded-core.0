Received: from va3ehsobe003.messaging.microsoft.com ([216.32.180.13]
	helo=VA3EHSOBE003.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RWX2k-0008U9-RN
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 18:37:03 +0100
Received: from mail198-va3-R.bigfish.com (10.7.14.243) by
	VA3EHSOBE003.bigfish.com (10.7.40.23) with Microsoft SMTP Server id
	14.1.225.22; Fri, 2 Dec 2011 17:30:13 +0000
Received: from mail198-va3 (localhost [127.0.0.1])	by
	mail198-va3-R.bigfish.com (Postfix) with ESMTP id 6F7F4280860	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 17:30:12 +0000 (UTC)
X-SpamScore: -16
X-BigFish: VS-16(z21eNz9371K98dK4015Lzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h61h)
X-Spam-TCS-SCL: 0:0
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
Received: from mail198-va3 (localhost.localdomain [127.0.0.1]) by mail198-va3
	(MessageSwitch) id 1322847011450019_21753;
	Fri,  2 Dec 2011 17:30:11 +0000 (UTC)
Received: from VA3EHSMHS031.bigfish.com (unknown [10.7.14.246])	by
	mail198-va3.bigfish.com (Postfix) with ESMTP id 5E46F440046	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 17:30:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS031.bigfish.com
	(10.7.99.41) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 2 Dec 2011 17:30:10 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-003.039d.mgd.msft.net ([10.84.1.16]) with mapi id
	14.01.0339.002; Fri, 2 Dec 2011 11:29:05 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/4] x11vnc: Upgrade to 0.9.13
Thread-Index: AQHMsRbkJE9esUIF0ES5QwysDRlZJpXJMcqAgAAARwA=
Date: Fri, 2 Dec 2011 17:29:05 +0000
Message-ID: <CAEsOVNfiPdaPWQ_JNkedJFufPP4tkqHwmgfuM4me-pwN1yNa1A@mail.gmail.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
	<2fe1910927e5741631767ed3611e361749c75d3c.1322812458.git.edwin.zhai@intel.com>
	<CAEsOVNdALC9P7rqrDpo4upMiT_VX6BaE5nJY0c0OrkWW+Bmusg@mail.gmail.com>
	<1477738.LtqQ04SYOs@helios>
In-Reply-To: <1477738.LtqQ04SYOs@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: [PATCH 3/4] x11vnc: Upgrade to 0.9.13
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
X-List-Received-Date: Fri, 02 Dec 2011 17:37:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <67DDEDF0AD8BFD46A8E227833A2FB89D@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2011 at 11:27 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> In this case since PV has been increased at the same time (by renaming th=
e
> recipe) it's not only OK, it's recommended practice.

Ahh Ok. New recipe =3D reset PR.

Thanks,
Matthew=



