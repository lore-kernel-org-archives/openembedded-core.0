Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R23d4-0007rR-Eo
	for openembedded-core@lists.openembedded.org;
	Fri, 09 Sep 2011 18:08:34 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 09 Sep 2011 09:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,356,1312182000"; d="scan'208";a="47180563"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by azsmga001.ch.intel.com with ESMTP; 09 Sep 2011 09:03:28 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.226.10) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 9 Sep 2011 09:03:28 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx605.amr.corp.intel.com ([10.22.226.10]) with mapi; Fri, 9 Sep 2011
	09:03:28 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 9 Sep 2011 09:03:27 -0700
Thread-Topic: [OE-core] [PATCH 1/1] image-types: add btrfs as a supported
	fstype
Thread-Index: Acxt9sYOs6fk8RioQliYRAUNDyGZUABExs8Q
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94DF05381F@orsmsx504.amr.corp.intel.com>
References: <cover.1315343093.git.nitin.a.kamble@intel.com>
	<7318770f8b3b34d4ec29ee592971a5be96e53151.1315343093.git.nitin.a.kamble@intel.com>
	<20110907071541.GB4181@chargestorm.se>
	<9DA5872FEF993D41B7173F58FCF6BE94DEFEF755@orsmsx504.amr.corp.intel.com>
	<20110908071310.GB3928@chargestorm.se>
In-Reply-To: <20110908071310.GB3928@chargestorm.se>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] image-types: add btrfs as a supported fstype
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
X-List-Received-Date: Fri, 09 Sep 2011 16:08:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>=20
> My apologies.
> You're correct in that the pieces mentioned by Josh is already in the
> tree.
>=20
> However, the commit log should probably have included something like
> "enabling btrfs support for hob", perhaps worded slightly better.

Makes sense. I was not aware of that line is there for hob, now I know it, =
and change the commit log.
Nitin

>=20
> Cheers,
> Anders
>=20

> --
> Anders Darander
> ChargeStorm AB
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


