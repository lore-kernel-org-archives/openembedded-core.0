Received: from am1ehsobe004.messaging.microsoft.com ([213.199.154.207]
	helo=AM1EHSOBE004.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RWWuk-0008Ac-MZ
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 18:28:46 +0100
Received: from mail109-am1-R.bigfish.com (10.3.201.249) by
	AM1EHSOBE004.bigfish.com (10.3.204.24) with Microsoft SMTP Server id
	14.1.225.22; Fri, 2 Dec 2011 17:22:00 +0000
Received: from mail109-am1 (localhost [127.0.0.1])	by
	mail109-am1-R.bigfish.com (Postfix) with ESMTP id CE34850061A	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 17:22:00 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(z21eNz9371K98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail109-am1 (localhost.localdomain [127.0.0.1]) by mail109-am1
	(MessageSwitch) id 1322846520783391_30534;
	Fri,  2 Dec 2011 17:22:00 +0000 (UTC)
Received: from AM1EHSMHS016.bigfish.com (unknown [10.3.201.243])	by
	mail109-am1.bigfish.com (Postfix) with ESMTP id AF08F340043	for
	<openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2011 17:22:00 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS016.bigfish.com
	(10.3.207.154) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Fri, 2 Dec 2011 17:21:58 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.01.0339.002; Fri, 2 Dec 2011 11:21:57 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/4] x11vnc: Upgrade to 0.9.13
Thread-Index: AQHMsRbkJE9esUIF0ES5QwysDRlZJg==
Date: Fri, 2 Dec 2011 17:21:57 +0000
Message-ID: <CAEsOVNdALC9P7rqrDpo4upMiT_VX6BaE5nJY0c0OrkWW+Bmusg@mail.gmail.com>
References: <cover.1322812458.git.edwin.zhai@intel.com>
	<2fe1910927e5741631767ed3611e361749c75d3c.1322812458.git.edwin.zhai@intel.com>
In-Reply-To: <2fe1910927e5741631767ed3611e361749c75d3c.1322812458.git.edwin.zhai@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
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
X-List-Received-Date: Fri, 02 Dec 2011 17:28:46 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <CE8E4D60F9297444B93F9517AC5716D2@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 2, 2011 at 1:55 AM,  <edwin.zhai@intel.com> wrote:
> -PR =3D "r2"
> +PR =3D "r0"

Isn't this wrong?

-M=



