Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVrzA-0007Io-Ft
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 22:46:36 +0100
Received: by eekc1 with SMTP id c1so702103eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 13:39:53 -0800 (PST)
Received: by 10.14.4.21 with SMTP id 21mr550494eei.35.1322689192840;
	Wed, 30 Nov 2011 13:39:52 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v3sm10473105eej.7.2011.11.30.13.39.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 13:39:51 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 30 Nov 2011 22:39:46 +0100
In-Reply-To: <201111302206.19933.GNUtoo@no-log.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4EC1A8A1.5010303@balister.org> <1321315894.26881.117.camel@ted>
	<201111302206.19933.GNUtoo@no-log.org>
Message-Id: <EDB225A4-A3FF-4B0B-BF6B-A8DE91732721@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: Build failure in samba
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
X-List-Received-Date: Wed, 30 Nov 2011 21:46:36 -0000
X-Groupsio-MsgNum: 13325
Content-Type: multipart/signed;
	boundary="Apple-Mail=_871ECB4B-589E-41D3-B3F8-97B40FB75B90";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_871ECB4B-589E-41D3-B3F8-97B40FB75B90
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 22:06 heeft Denis 'GNUtoo' Carikli het volgende =
geschreven:

> Sorry for the late reply,
> I forgott to reply to that mail....
>=20
>> +       ac_cv_path_PYTHON=3D/not/exist \
> Thanks a lot for me that helped.

It would be nice if someone would send a patch to fix that in meta-oe...=

--Apple-Mail=_871ECB4B-589E-41D3-B3F8-97B40FB75B90
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7WoqQACgkQMkyGM64RGpEG6QCgksbfsKsXf/yGP0PAcbq+SxTb
t5EAoLYpHPf8Na9KtptIskLag66plsJf
=QIHg
-----END PGP SIGNATURE-----

--Apple-Mail=_871ECB4B-589E-41D3-B3F8-97B40FB75B90--
