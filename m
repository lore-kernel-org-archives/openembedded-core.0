Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RWRgG-0007Cu-H4
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 12:53:28 +0100
Received: by bkbzv15 with SMTP id zv15so2964982bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 03:46:46 -0800 (PST)
Received: by 10.204.136.200 with SMTP id s8mr10631063bkt.49.1322826406028;
	Fri, 02 Dec 2011 03:46:46 -0800 (PST)
Received: from [172.20.1.19] (ip5451781a.direct-adsl.nl. [84.81.120.26])
	by mx.google.com with ESMTPS id n14sm940196bkn.13.2011.12.02.03.46.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 03:46:45 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4517756.DZJl4RxAdk@helios>
Date: Fri, 2 Dec 2011 12:46:40 +0100
Message-Id: <188E020B-4FA5-4554-A145-E7581C3001A3@dominion.thruhere.net>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
	<8afb5fd67ea37c1ff2ff4513f797f409a0e8a556.1322782677.git.paul.eggleton@linux.intel.com>
	<95561DFA-A2E5-43AD-B83D-A83F3D329077@dominion.thruhere.net>
	<4517756.DZJl4RxAdk@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC PATCH 2/2] classes/buildhistory: merge in package history functionality
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
X-List-Received-Date: Fri, 02 Dec 2011 11:53:28 -0000
X-Groupsio-MsgNum: 13554
Content-Type: multipart/signed;
	boundary="Apple-Mail=_448A2C24-128E-433F-BDE4-E1FAB93E6D8D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_448A2C24-128E-433F-BDE4-E1FAB93E6D8D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 2 dec. 2011, om 12:35 heeft Paul Eggleton het volgende geschreven:

> On Friday 02 December 2011 11:15:31 Koen Kooi wrote:
>> Does this do a commit per build as well?
>=20
> Yes, since the commit occurs when bitbake completes (in response to =
the=20
> BuildCompleted event).

I noticed the extra bitbake spew :) =
https://github.com/Angstrom-distribution/buildhistory/commits/master

regards,

Koen=

--Apple-Mail=_448A2C24-128E-433F-BDE4-E1FAB93E6D8D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7YuqMACgkQMkyGM64RGpGJcQCgkIQXlVMQlelJJErE6B2xoq7U
ZZsAnR354pq6MEoJMocNN3LW131ayTzw
=zWH+
-----END PGP SIGNATURE-----

--Apple-Mail=_448A2C24-128E-433F-BDE4-E1FAB93E6D8D--
