Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QQx21-0000vH-TU
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 09:36:59 +0200
Received: by wwb17 with SMTP id 17so3058539wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2011 00:33:49 -0700 (PDT)
Received: by 10.216.67.199 with SMTP id j49mr2191661wed.59.1306740829126;
	Mon, 30 May 2011 00:33:49 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id b70sm2303993wek.44.2011.05.30.00.33.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 May 2011 00:33:48 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4DE34507.2090107@eukrea.com>
Date: Mon, 30 May 2011 09:33:46 +0200
Message-Id: <C74466A4-5C79-4E68-8D19-443498EF130E@dominion.thruhere.net>
References: <53EA452E-5E40-471F-8AF7-BE8303945241@dominion.thruhere.net>
	<4DE34507.2090107@eukrea.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: Any volunteers for fixing all the kernel version checks?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Mon, 30 May 2011 07:36:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 30 mei 2011, om 09:19 heeft Eric B=E9nard het volgende geschreven:

> Hi,
>=20
> On 30/05/2011 08:52, Koen Kooi wrote:
>> As some of you might have seen already: =
http://lwn.net/Articles/445223/ - linux 3.0 is going to happen.
>>=20
>> This means all the crufty "is it 2.4 or 2.6" checks are going to need =
a rework :)
>=20
> Does supporting 2.4 kernels still makes sense in 2011 ?

No, but I bet there are still checks present for that :) Or at least =
references like modprobe.26.=


