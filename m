Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RWCQK-00052u-6A
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 20:36:00 +0100
Received: by faaa19 with SMTP id a19so1546444faa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 11:29:18 -0800 (PST)
Received: by 10.180.90.195 with SMTP id by3mr5789851wib.30.1322767758468;
	Thu, 01 Dec 2011 11:29:18 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d17sm6849087wbh.19.2011.12.01.11.29.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 11:29:17 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Thu, 1 Dec 2011 20:29:13 +0100
In-Reply-To: <4ED7C95A.4060701@linux.intel.com>
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
	<1791C583-61A2-4087-8250-255FA25DAB22@dominion.thruhere.net>
	<4ED7C95A.4060701@linux.intel.com>
Message-Id: <7B66F8A5-9248-461A-BE54-0A1B65C22CE4@dominion.thruhere.net>
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
X-List-Received-Date: Thu, 01 Dec 2011 19:36:00 -0000
X-Groupsio-MsgNum: 13474
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0D15251C-9834-45B2-9E92-47E064C85B0C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0D15251C-9834-45B2-9E92-47E064C85B0C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 1 dec. 2011, om 19:37 heeft Joshua Lock het volgende geschreven:

>=20
>=20
> On 01/12/11 09:26, Koen Kooi wrote:
>>=20
>> Op 1 dec. 2011, om 18:17 heeft Richard Purdie het volgende =
geschreven:
>>=20
>>> On Thu, 2011-12-01 at 16:57 +0000, Phil Blundell wrote:
>>>> On Tue, 2011-11-29 at 14:51 -0800, Kamble, Nitin A wrote:
>>>>> Thank you for the explanation. BTW where can I find official rules =
about signed-off-by line
>>>>=20
>>>> The "Signed-off-by" idiom originated with the kernel people and
>>>> Documentation/SubmittingPatches in the linux source tree contains a
>>>> fairly good description of what it means to them.
>>>>=20
>>>> I'm not sure that there are any official rules about its use in OE =
apart
>>>> from what's in the Commit Patch Message Guidelines (see the wiki).
>>>=20
>>> The yocto docs do mention what the specific meaning of the line is.
>>=20
>> <pedantic mode>But this is oe-core.</pedantic mode>. Shall we all =
agree it's the same for OE-core as well?
>=20
> Isn't that the standard mode? ;-)

It actually is, glad someone noticed :)

> I expect folks have the same understanding as stated in the kernel and
> Yocto docs when using SOB - I see no reason for OE Core to introduce
> ambiguity.
>=20
> Joshua
> --=20
> Joshua Lock
>        Yocto Project "Johannes factotum"
>        Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


--Apple-Mail=_0D15251C-9834-45B2-9E92-47E064C85B0C
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7X1YsACgkQMkyGM64RGpHv6ACfQoIkyZnc2eVwReyXOoR7+tTK
Cm0An3Ye1foQfehc6XOL3lMsAuuqFbzb
=OCRa
-----END PGP SIGNATURE-----

--Apple-Mail=_0D15251C-9834-45B2-9E92-47E064C85B0C--
