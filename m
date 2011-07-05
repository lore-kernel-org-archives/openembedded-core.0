Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Qe97Z-0001l2-NZ
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 19:09:13 +0200
Received: by wwi18 with SMTP id 18so5209913wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Jul 2011 10:05:24 -0700 (PDT)
Received: by 10.216.220.212 with SMTP id o62mr4721043wep.75.1309885524037;
	Tue, 05 Jul 2011 10:05:24 -0700 (PDT)
Received: from [10.75.16.17] ([192.91.60.189])
	by mx.google.com with ESMTPS id gd1sm779549wbb.44.2011.07.05.10.05.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Jul 2011 10:05:23 -0700 (PDT)
References: <1309881139.2410.14.camel@phil-desktop>
	<1309881259.2410.16.camel@phil-desktop>
	<201107051731.12273.paul.eggleton@linux.intel.com>
From: Koen Kooi <koen@dominion.thruhere.net>
X-Mailer: iPhone Mail (8J2)
In-Reply-To: <201107051731.12273.paul.eggleton@linux.intel.com>
Message-Id: <16105787-5EC4-45A3-BC2F-61A4B6F43E14@dominion.thruhere.net>
Date: Tue, 5 Jul 2011 18:05:17 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (iPhone Mail 8J2)
Subject: Re: [PATCH] bluez-dtl1-workaround: remove PRIORITY
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
X-List-Received-Date: Tue, 05 Jul 2011 17:09:13 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



Op 5 jul. 2011 om 17:31 heeft Paul Eggleton <paul.eggleton@linux.intel.com> h=
et volgende geschreven:

> On Tuesday 05 July 2011 16:54:18 Phil Blundell wrote:
>> Or an alternative patch might be just to delete this recipe altogether.
>> Its sole purpose is to work around defects in hardware which must be the
>> best part of a decade old and I would be slightly surprised if anyone
>> was still using DTL1s in this day and age.
>=20
> Is it possible some people are still using PCMCIA/CF cards with this hardw=
are=20
> in it?

not that I'm using it, but there's one in my box with ipaq stuff :)


>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


