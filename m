Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSv0M-0006ze-LQ
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:23:38 +0100
Received: by faat2 with SMTP id t2so758788faa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 10:17:07 -0800 (PST)
Received: by 10.180.109.83 with SMTP id hq19mr19706946wib.54.1321985827378;
	Tue, 22 Nov 2011 10:17:07 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id gd6sm17471563wbb.1.2011.11.22.10.17.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 10:17:06 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 22 Nov 2011 19:17:01 +0100
In-Reply-To: <2419769.NUvRBCfOV2@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ECBE307.1080600@linaro.org>
	<5C583370-13B0-49CD-B3C0-BB4DC3F223A2@dominion.thruhere.net>
	<2419769.NUvRBCfOV2@helios>
Message-Id: <F5582724-3A62-4B8A-8575-686FD03C2AA3@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Getting started on creating a layer for OE-Core
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
X-List-Received-Date: Tue, 22 Nov 2011 18:23:38 -0000
X-Groupsio-MsgNum: 12733
Content-Type: multipart/signed;
	boundary="Apple-Mail=_FF5753DD-EB4B-4F1B-A94A-B4E5515B603B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_FF5753DD-EB4B-4F1B-A94A-B4E5515B603B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 22 nov. 2011, om 19:08 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 22 November 2011 19:02:55 Koen Kooi wrote:
>> You do know that the gcc 4.6 in OE-core and gcc 4.5 in meta-oe =
already have
>> all the linaro patches (minus the ones that introduces bugs), right?
>=20
> How would one find that out? I mean, without looking at every patch we =
have in=20
> our toolchain...

We have been pointing out that fact to various linaro people the past =
month, most recently at ELC-E and Linaro Connect. If for some reason =
that hasn't come accross, a 'git grep linaro' would have given you a big =
clue :)



--Apple-Mail=_FF5753DD-EB4B-4F1B-A94A-B4E5515B603B
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7L5yAACgkQMkyGM64RGpH9oQCfevpDq7QXafEOrX6Nmy1r8hX/
yRcAoKaHUVwnLtbXr2xLEUWXidLFk/+m
=gkSn
-----END PGP SIGNATURE-----

--Apple-Mail=_FF5753DD-EB4B-4F1B-A94A-B4E5515B603B--
