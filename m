Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1R9i6H-00015B-KL
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 20:46:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Sep 2011 11:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,468,1312182000"; d="scan'208";a="69143326"
Received: from orsmsx602.amr.corp.intel.com ([10.22.226.211])
	by fmsmga001.fm.intel.com with ESMTP; 30 Sep 2011 11:40:51 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.226.213) by
	orsmsx602.amr.corp.intel.com (10.22.226.211) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 30 Sep 2011 11:40:51 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx601.amr.corp.intel.com ([10.22.226.213]) with mapi;
	Fri, 30 Sep 2011 11:40:52 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 30 Sep 2011 11:40:47 -0700
Thread-Topic: [OE-core] [PATCH 4/4] python, python-native: upgrade from
	2.6.6 to 2.7.2
Thread-Index: Acx/oBN/peRQH5W0QEOTXHOgJo0aWwAACRKA
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94E0905BBC@orsmsx504.amr.corp.intel.com>
References: <cover.1317344910.git.nitin.a.kamble@intel.com>
	<efb11f0fc00b6406194a37db473d25409569ba81.1317344910.git.nitin.a.kamble@intel.com>
	<20110930183732.GH7364@jama.jama.net>
In-Reply-To: <20110930183732.GH7364@jama.jama.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: [PATCH 4/4] python, python-native: upgrade from 2.6.6 to 2.7.2
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
X-List-Received-Date: Fri, 30 Sep 2011 18:46:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Martin Jansa
> Sent: Friday, September 30, 2011 11:38 AM
> To: Patches and discussions about the oe-core layer
> Subject: Re: [OE-core] [PATCH 4/4] python, python-native: upgrade from
> 2.6.6 to 2.7.2
>=20
> On Thu, Sep 29, 2011 at 06:27:11PM -0700, nitin.a.kamble@intel.com
> wrote:
> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
> >
> > rename from meta/recipes-devtools/python/python-2.6-manifest.inc
> > rename to meta/recipes-devtools/python/python-2.7-manifest.inc
>=20
> this is wrong.. just to rename it isn't enough
>=20
> I will send patch which regenerates manifest with right paths to
> actually package something..
>=20
> Regards,

Hi Martin,
  Thanks for catching this. I did not see issue with old manifest. But gett=
ing new manifest would be better.
Thanks,
Nitin



