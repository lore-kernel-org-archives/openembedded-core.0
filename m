Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QDoa8-00080G-Ra
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Apr 2011 03:57:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 23 Apr 2011 18:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,260,1301900400"; d="scan'208";a="683053894"
Received: from orsmsx604.amr.corp.intel.com ([10.22.226.87])
	by fmsmga002.fm.intel.com with ESMTP; 23 Apr 2011 18:55:25 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.226.10) by
	orsmsx604.amr.corp.intel.com (10.22.226.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Sat, 23 Apr 2011 18:55:24 -0700
Received: from orsmsx504.amr.corp.intel.com ([10.22.226.207]) by
	orsmsx605.amr.corp.intel.com ([10.22.226.10]) with mapi;
	Sat, 23 Apr 2011 18:55:24 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 23 Apr 2011 18:55:23 -0700
Thread-Topic: [OE-core] Perl 5.12.2 no more fetchable
Thread-Index: AcwB9NWU4XbkEIYaRmqzaV5HoP9EIAALZt7w
Message-ID: <9DA5872FEF993D41B7173F58FCF6BE94D80E6DF4@orsmsx504.amr.corp.intel.com>
References: <BANLkTimoLw8aG6xm8zUgJXUfHRvJuqOdyA@mail.gmail.com>
In-Reply-To: <BANLkTimoLw8aG6xm8zUgJXUfHRvJuqOdyA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Re: Perl 5.12.2 no more fetchable
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
X-List-Received-Date: Sun, 24 Apr 2011 01:57:53 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Khem,
After seeing your email now, I am trying to upgrade perl from 5.12.2 to 5.1=
2.3. Let's see how does it turn out. Looking at changelog seems like not mu=
ch API kind of changes there, just bugfixes, so I am hoping it will work ou=
t easily.

Thanks,
Nitin


> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Khem Raj
> Sent: Saturday, April 23, 2011 1:26 PM
> To: Patches and discussions about the oe-core layer
> Subject: [OE-core] Perl 5.12.2 no more fetchable
>=20
> Since the latest stable is 5.12.3 this mirror we use in SRC_URI has
> decided to dump 5.12.2 tarball. Either we upgrade to 5.12.3 or find  a
> mirror which still have 5.12.2 e.g.
> http://search.cpan.org/CPAN/authors/id/J/JE/JESSE/perl-5.12.2.tar.gz
>=20
> Thanks
> -Khem
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


