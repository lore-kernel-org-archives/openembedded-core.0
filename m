Return-Path: <krzysztof.m.sywula@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 31A6F6BBB8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 15:20:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2014 07:20:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,598,1384329600"; d="scan'208";a="453283615"
Received: from irsmsx103.ger.corp.intel.com ([163.33.3.157])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2014 07:20:33 -0800
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX103.ger.corp.intel.com (163.33.3.157) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 3 Jan 2014 15:20:32 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.114]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.15]) with mapi id
	14.03.0123.003; Fri, 3 Jan 2014 15:20:32 +0000
From: "Sywula, Krzysztof M" <krzysztof.m.sywula@intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Thread-Topic: [OE-core] [PATCH] Adding irssi 0.8.16-rc1 recipe
Thread-Index: AQHPBiKLCoZCuG8xxEiSzyQP5WBYh5pzIgUw
Date: Fri, 3 Jan 2014 15:20:31 +0000
Message-ID: <6741EAAB26B57F4995668065CB62D86B33983EAC@IRSMSX102.ger.corp.intel.com>
References: <1388165434-28242-1-git-send-email-krzysztof.m.sywula@intel.com>
	<2704C375-0C8D-46B2-A11D-3FF220661AFB@dominion.thruhere.net>
In-Reply-To: <2704C375-0C8D-46B2-A11D-3FF220661AFB@dominion.thruhere.net>
Accept-Language: pl-PL, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Adding irssi 0.8.16-rc1 recipe
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
X-List-Received-Date: Fri, 03 Jan 2014 15:20:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, why would it be '0.8.15'? Recipe points to 0.8.16-rc1 tarball and that'=
s the only one that can be built. =


Thanks,
Krzysztof Sywula

-----Original Message-----
From: Koen Kooi [mailto:koen@dominion.thruhere.net] =

Sent: Tuesday, December 31, 2013 12:19 PM
To: Sywula, Krzysztof M
Cc: Patches and discussions about the oe-core layer
Subject: Re: [OE-core] [PATCH] Adding irssi 0.8.16-rc1 recipe


Op 27 dec. 2013, om 18:30 heeft krzysztof.m.sywula@intel.com het volgende g=
eschreven:

> From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
> =

> ---
> meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb | 11 +++++++++++

that should be 0.8.15+0.8.16-rc1 to conform to the versioning policy
-------------------------------------------------------------
Intel Ireland Limited (Branch)
Collinstown Industrial Park, Leixlip, County Kildare, Ireland
Registered Number: E902934

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.


