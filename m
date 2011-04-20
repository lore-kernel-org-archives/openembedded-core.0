Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QCak3-0003VY-Ol
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Apr 2011 18:59:03 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2011 09:56:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,247,1301900400"; d="scan'208";a="681596681"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by fmsmga002.fm.intel.com with ESMTP; 20 Apr 2011 09:56:27 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx602.amr.corp.intel.com ([10.22.226.211]) with mapi;
	Wed, 20 Apr 2011 09:56:27 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 20 Apr 2011 09:56:25 -0700
Thread-Topic: [OE-core] [PATCH] gcc: Add recipes for 4.6.0
Thread-Index: Acv/e09wrRnPVih8QRuzcw4556LcQgAAE2oQ
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94515DC701@orsmsx504.amr.corp.intel.com>
References: <1303273629-1631-1-git-send-email-raj.khem@gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94515DC58B@orsmsx504.amr.corp.intel.com>
	<4DAF0E5C.10106@linux.intel.com>
	<430B907C-AA81-410E-A9C7-EC5B15E58FAA@dominion.thruhere.net>
In-Reply-To: <430B907C-AA81-410E-A9C7-EC5B15E58FAA@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH] gcc: Add recipes for 4.6.0
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
X-List-Received-Date: Wed, 20 Apr 2011 16:59:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> >> Hi Khem,
> >>   Great to have these patches. And thanks for getting them out early
> :) I will check them out and give you feedback on them. Are they
> available in a tree format or tar.gz so that I can try them with Yocto
> easily?
> >> Thanks&  Regards,
> >> Nitin
> >>
> > Nitin,
> >
> > you should be able to save Khem's email and apply it directly to your
> git branch via a "git am -i -s <saved email file>"  The -i option is
> for interactive apply and -s sign's it.
>=20
> Or get the mbox from http://patches.openembedded.org/patch/2523/ , that
> should work as well
>=20

Thanks Saul & Koen,  With this information I should be get it working.
Nitin



