Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E18C61EEB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 10:55:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2013 03:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,933,1367996400"; d="scan'208";a="366744772"
Received: from irsmsx101.ger.corp.intel.com ([163.33.3.153])
	by orsmga001.jf.intel.com with ESMTP; 22 Aug 2013 03:55:16 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX101.ger.corp.intel.com ([169.254.1.83]) with mapi id
	14.03.0123.003; Thu, 22 Aug 2013 11:55:11 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and
	more (Initial ACK Please)!
Thread-Index: AQHOnx237AhxK4sw9U+nbh/jr6OpHJmhDabg
Date: Thu, 22 Aug 2013 10:55:11 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C17DEE@IRSMSX105.ger.corp.intel.com>
References: <cover.1377150822.git.sgw@linux.intel.com>
	<6560539.TdGG90GaLI@helios>
	<969F26A8BAB325438E7EB80D3C3134FB16C17CB1@IRSMSX105.ger.corp.intel.com>
	<20130822095515.GJ522@jama>
In-Reply-To: <20130822095515.GJ522@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and more (Initial ACK Please)!
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
X-List-Received-Date: Thu, 22 Aug 2013 10:55:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Sorry, for the moment, I don't have the necessary time resources to switch =
to another email client.
I will do it after 1.5 release.
Regards,
Cristian

-----Original Message-----
From: Martin Jansa [mailto:martin.jansa@gmail.com]=20
Sent: Thursday, August 22, 2013 12:55 PM
To: Iorga, Cristian
Cc: Paul Eggleton; openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [CONSOLIDATED PULL 00/62] Python3, Packge Exlude and=
 more (Initial ACK Please)!

On Thu, Aug 22, 2013 at 09:14:07AM +0000, Iorga, Cristian wrote:
>=20
> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org=20
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of=20
> Paul Eggleton
> Sent: Thursday, August 22, 2013 12:08 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [CONSOLIDATED PULL 00/62] Python3, Packge Exlude a=
nd more (Initial ACK Please)!

Iorga, please get better e-mail client, there is no way to see what was wri=
tten by you and what was there from Paul's reply.

> > Cristian Iorga (4):
> >   packagegroup-self-hosted: pcmanfm integration
> >   builder: register directories with pcmanfm
> >   build-appliance-image: changing the icon theme to sato
> >   default-providers: Set the preferred provider for bluez
>=20
> I thought we were going to fix the libasound-module-bluez multiple provid=
er issue by renaming the package?
>  - Actually, that involves more changes (change in packagegroup-base.bb) =
and I think that this change will be eliminated once we will make the chang=
e to BlueZ5 in the next release (or I hope so :-) ).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

