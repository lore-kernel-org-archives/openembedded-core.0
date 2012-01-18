Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Rncsv-00011N-Ml
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 22:17:33 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Jan 2012 13:09:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97284108"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by azsmga001.ch.intel.com with ESMTP; 18 Jan 2012 13:09:09 -0800
Received: from orsmsx102.amr.corp.intel.com (10.22.225.129) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 18 Jan 2012 13:09:09 -0800
Received: from orsmsx106.amr.corp.intel.com ([169.254.5.13]) by
	ORSMSX102.amr.corp.intel.com ([169.254.1.7]) with mapi id
	14.01.0355.002; Wed, 18 Jan 2012 13:09:09 -0800
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/5] guile: new recipe for autogen
Thread-Index: AQHM1VcCSAYx49LWRUWx61XcANBMzpYSabuAgAA1APA=
Date: Wed, 18 Jan 2012 21:09:06 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C012A36FC@ORSMSX106.amr.corp.intel.com>
References: <b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<b8e0859cf0bc609d134ce75fc763ff305549a0c1.1326831402.git.nitin.a.kamble@intel.com>
	<10DCD6A9-4386-4224-A1EE-F5C97CD71CD8@dominion.thruhere.net>
In-Reply-To: <10DCD6A9-4386-4224-A1EE-F5C97CD71CD8@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] guile: new recipe for autogen
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
X-List-Received-Date: Wed, 18 Jan 2012 21:17:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Koen Kooi
> Sent: Wednesday, January 18, 2012 1:54 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 3/5] guile: new recipe for autogen
>=20
>=20
> Op 17 jan. 2012, om 21:30 heeft nitin.a.kamble@intel.com het volgende
> geschreven:
>=20
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > guile recipe is needed by autogen.
>=20
> How much does this differ from the guile in meta-oe?

Koen,
  I could not get the guide-config-cross stuff working with this version.=20
I don't understand guile that well to fix this.=20
Who created the guilt recipes in meta-oe ?=20
Other than that I don't see any functional differences other than newer
Version.

Nitin


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


