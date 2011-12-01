Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RWAVD-0007sQ-OX
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 18:32:56 +0100
Received: by eaad13 with SMTP id d13so2480322eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 09:26:14 -0800 (PST)
Received: by 10.213.19.72 with SMTP id z8mr239896eba.35.1322760374017;
	Thu, 01 Dec 2011 09:26:14 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id z54sm19574409eeh.5.2011.12.01.09.26.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 09:26:13 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 18:26:09 +0100
In-Reply-To: <1322759839.17484.141.camel@ted>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322594901.git.nitin.a.kamble@intel.com>
	<48bd68cce53c87c7f9296a0a0ad5286efef7d5cc.1322594901.git.nitin.a.kamble@intel.com>
	<1322598026.3077.11.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3D9E7EE@orsmsx504.amr.corp.intel.com>
	<1322604347.3077.18.camel@lenovo.internal.reciva.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E3D9E9B9@orsmsx504.amr.corp.intel.com>
	<1322758679.26081.242.camel@phil-desktop>
	<1322759839.17484.141.camel@ted>
Message-Id: <1791C583-61A2-4087-8250-255FA25DAB22@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/4] gmp: also generate the libgmpcxx library & package it properly
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
X-List-Received-Date: Thu, 01 Dec 2011 17:32:56 -0000
X-Groupsio-MsgNum: 13469
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DC6789A3-2A12-4440-92E2-3B4CBC6D599A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DC6789A3-2A12-4440-92E2-3B4CBC6D599A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 18:17 heeft Richard Purdie het volgende geschreven:

> On Thu, 2011-12-01 at 16:57 +0000, Phil Blundell wrote:
>> On Tue, 2011-11-29 at 14:51 -0800, Kamble, Nitin A wrote:
>>> Thank you for the explanation. BTW where can I find official rules =
about signed-off-by line
>>=20
>> The "Signed-off-by" idiom originated with the kernel people and
>> Documentation/SubmittingPatches in the linux source tree contains a
>> fairly good description of what it means to them.
>>=20
>> I'm not sure that there are any official rules about its use in OE =
apart
>> from what's in the Commit Patch Message Guidelines (see the wiki).
>=20
> The yocto docs do mention what the specific meaning of the line is.

<pedantic mode>But this is oe-core.</pedantic mode>. Shall we all agree =
it's the same for OE-core as well?




--Apple-Mail=_DC6789A3-2A12-4440-92E2-3B4CBC6D599A
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7XuLMACgkQMkyGM64RGpHeLgCfcXUA//3Qhk21hzVue3yk+6gG
xUMAoIkmhn6ZpZhyQUShMfF9CFT1XESk
=s/ep
-----END PGP SIGNATURE-----

--Apple-Mail=_DC6789A3-2A12-4440-92E2-3B4CBC6D599A--
