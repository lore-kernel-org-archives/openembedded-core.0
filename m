Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVJsg-0003Hd-5N
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 10:21:40 +0100
Received: by eekc1 with SMTP id c1so947634eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 01:14:59 -0800 (PST)
Received: by 10.227.203.10 with SMTP id fg10mr13500829wbb.1.1322558098939;
	Tue, 29 Nov 2011 01:14:58 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dy1sm15513694wib.18.2011.11.29.01.14.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 01:14:58 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 29 Nov 2011 10:14:56 +0100
In-Reply-To: <4ED49F3E.2010403@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322554339.git.wenzong.fan@windriver.com>	<647b040f65373d5f2922a381f3515c62471773c8.1322554339.git.wenzong.fan@windriver.com>
	<928A241D-6223-4A84-9681-A4472F0DFC01@dominion.thruhere.net>
	<4ED49F3E.2010403@windriver.com>
Message-Id: <3EE7C44E-0177-4150-8A93-4A1F7107BD90@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 4/5] autoconf: Extend to provide nativesdk	recipe
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
X-List-Received-Date: Tue, 29 Nov 2011 09:21:40 -0000
X-Groupsio-MsgNum: 13078
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BBBD5DA7-9E71-4637-864A-83AF9DDB4035";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BBBD5DA7-9E71-4637-864A-83AF9DDB4035
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 29 nov. 2011, om 10:00 heeft wenzong fan het volgende geschreven:

> On 11/29/2011 04:49 PM, Koen Kooi wrote:
>> Op 29 nov. 2011, om 09:39 heeft<wenzong.fan@windriver.com>  =
<wenzong.fan@windriver.com>  het volgende geschreven:
>>=20
>>  =20
>>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>>=20
>>> [YOCTO #1603]
>>>    =20
>> For every recipe: what is '[yocto #1603]'?
>=20
> http://bugzilla.pokylinux.org/show_bug.cgi?id=3D1603
>=20
> The updates to each recipe was related to this requirement for yocto =
1.2, so I add the id number in all commit messages.

If you add such IDs you need to add a lot more info like a summary of =
the bugreport. People reading commit logs aren't going to know and URI =
to yocto bz (especially in OE-core git) and even if they'd know, opening =
a webbrowser to understand a commit message is not good.



--Apple-Mail=_BBBD5DA7-9E71-4637-864A-83AF9DDB4035
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7UopEACgkQMkyGM64RGpGm3wCfeZeVD95D8eIRk9BjvWpt0Q3e
KzAAn0EMyshuL/7dB1sW4eI4gsnRZcZj
=mcAS
-----END PGP SIGNATURE-----

--Apple-Mail=_BBBD5DA7-9E71-4637-864A-83AF9DDB4035--
