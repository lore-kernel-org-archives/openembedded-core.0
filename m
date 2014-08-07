Return-Path: <max.eliaser@intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 92B286A362
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Aug 2014 22:34:40 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 07 Aug 2014 15:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,820,1400050800"; d="scan'208";a="466267695"
Received: from orsmsx108.amr.corp.intel.com ([10.22.240.6])
	by azsmga001.ch.intel.com with ESMTP; 07 Aug 2014 15:33:49 -0700
Received: from orsmsx156.amr.corp.intel.com (10.22.240.22) by
	ORSMSX108.amr.corp.intel.com (10.22.240.6) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Thu, 7 Aug 2014 15:33:49 -0700
Received: from orsmsx110.amr.corp.intel.com ([169.254.3.162]) by
	ORSMSX156.amr.corp.intel.com ([169.254.8.130]) with mapi id
	14.03.0123.003; Thu, 7 Aug 2014 15:33:49 -0700
From: "Eliaser, MaX" <max.eliaser@intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [OE-core] [PATCH 0/2] Upstream recipe for bootchart2 from
	WebOS (revised again)
Thread-Index: AQHPsofjpc2GFTJqJkCyk9ci9DW1bZvFuH0Y
Date: Thu, 7 Aug 2014 22:33:48 +0000
Message-ID: <E88D0531F83F3744B03D1A909A2B070F5EDE3E@ORSMSX110.amr.corp.intel.com>
References: <cover.1407445120.git.max.eliaser@intel.com>,
	<20140807213833.GY14848@jama>
In-Reply-To: <20140807213833.GY14848@jama>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.19.9.41]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Upstream recipe for bootchart2 from WebOS (revised again)
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
X-List-Received-Date: Thu, 07 Aug 2014 22:34:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The first time I submitted this patch series a few weeks ago, that part got=
 accepted without me noticing, so it's already in oe-core. Saul pointed thi=
s out to me, so I rebased to get that patch out of the series.

-Max
________________________________________
From: Martin Jansa [martin.jansa@gmail.com]
Sent: Thursday, August 07, 2014 2:38 PM
To: Eliaser, MaX
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/2] Upstream recipe for bootchart2 from WebO=
S (revised again)


This one is missing pycairo change, is it intentional?

--
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

