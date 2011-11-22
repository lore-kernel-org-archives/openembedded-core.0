Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RSumn-0001OC-J4
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 19:09:37 +0100
Received: by wwo1 with SMTP id 1so348760wwo.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2011 10:03:03 -0800 (PST)
Received: by 10.216.137.215 with SMTP id y65mr3225845wei.66.1321984983526;
	Tue, 22 Nov 2011 10:03:03 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id u3sm4127678wiu.10.2011.11.22.10.03.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Nov 2011 10:03:02 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 22 Nov 2011 19:02:55 +0100
In-Reply-To: <4ECBE307.1080600@linaro.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4ECBE307.1080600@linaro.org>
Message-Id: <5C583370-13B0-49CD-B3C0-BB4DC3F223A2@dominion.thruhere.net>
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
X-List-Received-Date: Tue, 22 Nov 2011 18:09:37 -0000
X-Groupsio-MsgNum: 12728
Content-Type: multipart/signed;
	boundary="Apple-Mail=_82E4A5A0-4735-4F82-8489-7B98C348F503";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_82E4A5A0-4735-4F82-8489-7B98C348F503
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 22 nov. 2011, om 18:59 heeft Ken Werner het volgende geschreven:

> Hi,
>=20
> I'm currently reading the OpenEmbedded User Manual and wondering =
what's the best way to add a layer for the Linaro toolchain components

You do know that the gcc 4.6 in OE-core and gcc 4.5 in meta-oe already =
have all the linaro patches (minus the ones that introduces bugs), =
right?



--Apple-Mail=_82E4A5A0-4735-4F82-8489-7B98C348F503
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7L49QACgkQMkyGM64RGpGBAACgh4gv6zHcnEbVu6bZHCkduQ/5
7pYAnjT6XQU7dAd4BWcRVV66vAGSEnrW
=gqIW
-----END PGP SIGNATURE-----

--Apple-Mail=_82E4A5A0-4735-4F82-8489-7B98C348F503--
