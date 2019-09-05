Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C21187D771
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 09:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 41BDD1849F;
	Thu,  5 Sep 2019 11:35:24 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id tY1cziEiJMwK; Thu,  5 Sep 2019 11:35:22 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id C66421848E;
	Thu,  5 Sep 2019 11:35:22 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B13471E079;
	Thu,  5 Sep 2019 11:35:22 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A54981E074;
	Thu,  5 Sep 2019 11:35:22 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Thu,  5 Sep 2019 11:35:22 +0200 (CEST)
Received: from xbox05.axis.com (xbox05.axis.com [10.0.15.175])
	by seth.se.axis.com (Postfix) with ESMTP id 9931B2AAD;
	Thu,  5 Sep 2019 11:35:22 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by xbox05.axis.com (10.0.15.175)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 5 Sep 2019 11:35:22 +0200
Received: from xbox06.axis.com (10.0.15.176) by xbox12.axis.com (10.0.5.26)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Thu, 5 Sep 2019 11:35:22 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Thu, 5 Sep 2019 11:35:22 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Adrian Bunk <bunk@stusta.de>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH 6/6] xz: Remove GPLv3 license checksum
Thread-Index: AQHVVGtGe/REnsSq10qeamEBbv4fgab+HgoAgBEbbYCAAAY5gIALCXKAgAEfSACAAHB9gIAAEa2AgAEE7jA=
Date: Thu, 5 Sep 2019 09:35:21 +0000
Message-ID: <d1c08de542c74d4bba64143d50013891@xbox06.axis.com>
References: <20190816194405.12751-1-wesley.lindauer@gmail.com>
	<20190816194405.12751-6-wesley.lindauer@gmail.com>
	<CAMKF1sruqPBcwobNNErkdHKAnP7zT8zda81O2FUP88u=5ZnmVg@mail.gmail.com>
	<20190827180449.GA29638@localhost>
	<5fc12556-a817-e312-e1ed-60878a97d78c@windriver.com>
	<CALBQxSsXuM+926J=A=2R=X7xPSz4htuFk3pKrJ3Zpj1uK0AXDw@mail.gmail.com>
	<32b3f42b-2ff1-79c8-2777-b9a788190969@windriver.com>
	<0f8a4a800e70afe1eef8875571dbb50e1dc8f865.camel@linuxfoundation.org>
	<20190904195351.GA21155@localhost>
In-Reply-To: <20190904195351.GA21155@localhost>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] xz: Remove GPLv3 license checksum
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Sep 2019 09:35:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Adrian Bunk
> Sent: den 4 september 2019 21:54
> To: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Patches and discussions about the oe-core layer <openembedded-
> core@lists.openembedded.org>
> Subject: Re: [OE-core] [PATCH 6/6] xz: Remove GPLv3 license checksum
>=20
> On Wed, Sep 04, 2019 at 07:50:35PM +0100, Richard Purdie wrote:
> > On Wed, 2019-09-04 at 08:07 -0400, Mark Hatle wrote:
> > > On 9/3/19 1:59 PM, Wes Lindauer wrote:
> > > > Mark,
> > > >
> > > > In reference to "It typically does NOT include the license of
> > > > things used to
> > > > build the software (such as makefiles, autoconf fragments, etc)".
> > > > Since the only file that is licensed under GPLv3 is a M4 macro,
> > > > does that mean
> > > > the current patch is still valid? Shouldn't the GPLv3 license be
> > > > removed from
> > > > this recipe?
> > >
> > > Unless the M4 file is generating/injecting code into the build(very
> > > few I've
> > > seen do this), then I would say it's not under GPLv3 at all.  (And
> I
> > > wouldn't
> > > have included GPLv3 in the LICENSE statement.)
> > >
> > > But we need more consensus then just me saying so.
> > >
> > > This may be a good question for the OE-TSC to ensure that we have
> > > clarification
> > > on this issue, and it's not just me saying I think one way or
> > > another.
> >
> > Not sure it needs to go to the TSC, we just need a patch which
> clearly
> > says why the LICENSE statement is incorrect. I don't think the
> original
> > patch in the series was clear about why GPLv3 didn't apply but if the
> > commit message is improved, its probably fine.
>=20
> I am getting more and more confused about both the patch and the
> semantics of LICENSE.
>=20
> The status quo in the recipe is:
>=20
> <--  snip  ->
>=20
> # The source includes bits of PD, GPLv2, GPLv3, LGPLv2.1+, but the only
> file
> # which is GPLv3 is an m4 macro which isn't shipped in any of our
> packages,
> # and the LGPL bits are under lib/, which appears to be used for
> libgnu, which
> # appears to be used for DOS builds. So we're left with GPLv2+ and PD.
> LICENSE =3D "GPLv2+ & GPL-3.0-with-autoconf-exception & LGPLv2.1+ & PD"
> LICENSE_${PN} =3D "GPLv2+"
> LICENSE_${PN}-dev =3D "GPLv2+"
> LICENSE_${PN}-staticdev =3D "GPLv2+"
> LICENSE_${PN}-doc =3D "GPLv2+"
> LICENSE_${PN}-dbg =3D "GPLv2+"
> LICENSE_${PN}-locale =3D "GPLv2+"
> LICENSE_liblzma =3D "PD"
>=20
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D97d554a32881fee0aa283d96e47cb2=
4a \
>=20
> file://COPYING.GPLv2;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
>=20
> file://COPYING.GPLv3;md5=3Dd32239bcb673463ab874e80d47fae504 \
>=20
> file://COPYING.LGPLv2.1;md5=3D4fbd65380cdd255951079008b364516c \
>=20
> file://lib/getopt.c;endline=3D23;md5=3D2069b0ee710572c03bb3114e4532cd84 \
>                     "
>=20
> <--  snip  -->
>=20
> My confusion about the patch is that it removes COPYING.GPLv3 from
> LIC_FILES_CHKSUM but keeps GPL-3.0-with-autoconf-exception in LICENSE.
>=20
> My confusion about the semantics of LICENSE is that I fail to find a
> clear statement in the documentation that the legal meaning of LICENSE
> in OE is what Mark claims it would be. Is this just Marks personal
> opinion on what should be done, or is this undocumented tribal
> knowledge, or is the exact semantics of LICENSE documented
> somewhere in a language that lawyers understand?
>=20
> My guess for the latter would be "undocumented tribal knowledge",
> and clarification is required what is actually correct or incorrect
> here. And I think this is also what Mark was asking for.
>=20
> > Cheers,
> >
> > Richard
>=20
> cu
> Adrian

Another thing that complicates this further is related to gathering and=20
distributing the license information. E.g., if one uses COPY_LIC_DIR =3D "1=
"=20
to automatically include all the license information for all packages=20
installed in the image, this will include everything listed in=20
LIC_FILES_CHKSUM regardless of which packages were installed. I.e., even=20
if only liblzma (which is PD) is installed from xz, all of the GPL=20
license texts will be installed in /usr/share/common-licenses/xz...

//Peter


