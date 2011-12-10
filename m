Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RZIDr-0007fn-44
	for openembedded-core@lists.openembedded.org;
	Sat, 10 Dec 2011 09:23:55 +0100
Received: by wgbds11 with SMTP id ds11so6175976wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 Dec 2011 00:17:03 -0800 (PST)
Received: by 10.180.94.71 with SMTP id da7mr13927812wib.29.1323505018727;
	Sat, 10 Dec 2011 00:16:58 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d17sm15373574wbh.19.2011.12.10.00.16.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 10 Dec 2011 00:16:57 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Sat, 10 Dec 2011 09:16:55 +0100
In-Reply-To: <CAMKF1sp3MfaSGpAQMiafWxJw8VEv9_BNNVEpzzYcBQbsxpihdg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1323286080.git.elizabeth.flanagan@intel.com>
	<b3e01cfa4f1561a77b07e3365459e9498d8c4585.1323286080.git.elizabeth.flanagan@intel.com>
	<1323437428.5309.154.camel@ted>
	<CAMKF1sp3MfaSGpAQMiafWxJw8VEv9_BNNVEpzzYcBQbsxpihdg@mail.gmail.com>
Message-Id: <FB606EB2-C1A7-4264-ACEF-543155D48AF7@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 6/8] [YOCTO #1776] license: manifest and license path
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
X-List-Received-Date: Sat, 10 Dec 2011 08:23:55 -0000
X-Groupsio-MsgNum: 14023
Content-Type: multipart/signed;
	boundary="Apple-Mail=_4819B791-4214-4F52-876C-1F5496418D8E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_4819B791-4214-4F52-876C-1F5496418D8E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 9 dec. 2011, om 20:57 heeft Khem Raj het volgende geschreven:

> On Fri, Dec 9, 2011 at 5:30 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>>=20
>> The above line is a bashism and is breaking builds with dash
>> as /bin/sh :(
>=20
> I thought bashism was too deep in oe. I can certainly revert to using =
dash if
> thats no longer the case.

We try to keep OE itself free of bashisms. The biggest problem is =
package authors using them like the libtool/gtk bashism interaction.

regards,

Koen=

--Apple-Mail=_4819B791-4214-4F52-876C-1F5496418D8E
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7jFXkACgkQMkyGM64RGpH/dgCgote0gAYwe+eAwbX1sURQjOl4
eWoAnA2y6R+h/wzB3NQEnhntnwKwOp78
=m3S8
-----END PGP SIGNATURE-----

--Apple-Mail=_4819B791-4214-4F52-876C-1F5496418D8E--
