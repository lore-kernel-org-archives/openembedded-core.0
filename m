Return-Path: <cristiana.voicu@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BEB6D6065F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 06:23:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Aug 2013 23:23:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,918,1367996400"; d="scan'208";a="388895603"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2013 23:23:18 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Tue, 20 Aug 2013 07:23:17 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.64]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.233]) with mapi id
	14.03.0123.003; Tue, 20 Aug 2013 07:23:17 +0100
From: "Voicu, Cristiana" <cristiana.voicu@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH 1/2] cronie: upgrade to 1.4.11
Thread-Index: AQHOmlqUfaJi9d71e0S9ODv/apNhbJmcJbAAgAABzwCAAX8l8A==
Date: Tue, 20 Aug 2013 06:23:16 +0000
Message-ID: <BE68E9C8E0850C43B0F0B0B7D57FA5AE2E7FC437@IRSMSX105.ger.corp.intel.com>
References: <cover.1376641437.git.cristiana.voicu@intel.com>
	<f9e441cc3a1beefe5e6463ed1db730f8803af38c.1376641437.git.cristiana.voicu@intel.com>
	<2871332.fhu1i0uVde@helios> <1416445.v9mPbDrrvP@helios>
In-Reply-To: <1416445.v9mPbDrrvP@helios>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] cronie: upgrade to 1.4.11
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
X-List-Received-Date: Tue, 20 Aug 2013 06:23:18 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Paul,

I saw the error today, yesterday I was ooo. Sorry for the mistake.
Cristiana

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com]=20
Sent: Monday, August 19, 2013 11:31 AM
To: Voicu, Cristiana
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] cronie: upgrade to 1.4.11

On Monday 19 August 2013 09:24:54 Paul Eggleton wrote:
> Hi Cristiana,
>=20
> On Friday 16 August 2013 11:30:49 Cristiana Voicu wrote:
> > LIC_FILES_CHKSUM changed because cron.h doesn't exist anymore.
> > Replaced it with cron.c.
> >
> >...
>=20
> A couple of people have reported this doesn't build, and I've=20
> confirmed it this morning:

Ah, I see Saul already sent a patch for this, sorry I didn't see it before.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

