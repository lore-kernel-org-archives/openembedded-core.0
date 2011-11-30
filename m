Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVei4-0005fo-J6
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 08:36:04 +0100
Received: by eekc1 with SMTP id c1so128861eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 23:29:21 -0800 (PST)
Received: by 10.14.9.203 with SMTP id 51mr111157eet.41.1322638161696;
	Tue, 29 Nov 2011 23:29:21 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id c9sm1343871eeb.0.2011.11.29.23.29.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 23:29:20 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 30 Nov 2011 08:29:19 +0100
In-Reply-To: <4ED5769C.2070905@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322607016.git.sgw@linux.intel.com>
	<63a8312e843e78942030e19786cc34ee752c851c.1322607016.git.sgw@linux.intel.com>
	<20111129230811.GN7441@jama.jama.net>
	<4ED573D3.4040408@linux.intel.com>
	<4ED5769C.2070905@linux.intel.com>
Message-Id: <BC884CA2-8283-4A4B-B1EF-DB3A13B6B05B@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 20/26] libiconv: Update to 1.14
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
X-List-Received-Date: Wed, 30 Nov 2011 07:36:04 -0000
X-Groupsio-MsgNum: 13250
Content-Type: multipart/signed;
	boundary="Apple-Mail=_60A9827D-52B8-4B99-A992-691DFFC332F4";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_60A9827D-52B8-4B99-A992-691DFFC332F4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 01:19 heeft Joshua Lock het volgende geschreven:

>=20
>=20
> On 29/11/11 16:07, Saul Wold wrote:
>>>=20
>>> where are checksums now?
>>>=20
>> Vanished!
>>=20
>> I did a fetch for all of these and did not see errors, will go back =
and
>> fix these and the Xorg-server.
>=20
> It's a NOTE not an ERROR. Maybe we should change that?

Yes, missing and/or wrong checksums should be a hard error. I think that =
would make Beths life easier as well :)

regards,

Koen=

--Apple-Mail=_60A9827D-52B8-4B99-A992-691DFFC332F4
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7V208ACgkQMkyGM64RGpH+SQCffdLiMn+4S5TBCqalZjhk+osx
CB0Anjbm2Aj9VV1dTBsEu0xmykT46IQW
=N8vL
-----END PGP SIGNATURE-----

--Apple-Mail=_60A9827D-52B8-4B99-A992-691DFFC332F4--
