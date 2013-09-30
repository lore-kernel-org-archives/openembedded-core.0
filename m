Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0A04B60EA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 08:03:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 30 Sep 2013 01:03:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1006,1371106800"; d="scan'208";a="403043741"
Received: from irsmsx102.ger.corp.intel.com ([163.33.3.155])
	by fmsmga001.fm.intel.com with ESMTP; 30 Sep 2013 01:03:00 -0700
Received: from irsmsx106.ger.corp.intel.com (163.33.3.31) by
	IRSMSX102.ger.corp.intel.com (163.33.3.155) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Mon, 30 Sep 2013 09:02:59 +0100
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.29]) by
	IRSMSX106.ger.corp.intel.com ([169.254.8.226]) with mapi id
	14.03.0123.003; Mon, 30 Sep 2013 09:02:59 +0100
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] Questions about Orc and GStreamer
Thread-Index: AQHOvV4Yj+e24NmHCkyIwC78taIyVZnd60bg
Date: Mon, 30 Sep 2013 08:02:58 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB16C43C69@IRSMSX105.ger.corp.intel.com>
References: <5248A04E.3060804@pseudoterminal.org>
In-Reply-To: <5248A04E.3060804@pseudoterminal.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Subject: Re: Questions about Orc and GStreamer
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
X-List-Received-Date: Mon, 30 Sep 2013 08:03:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Carlos,

Is this Orc?
http://code.entropywave.com/orc/

In this phase of the release cycle, is no longer possible to include orc in=
to dora YP release.
Also, package upgrades are no longer integrated in this phase of the releas=
e cycle.

However, for both packages, patches will be welcome after dora is released =
into the wild.

Regards,
Cristian

Cristian Iorga
Linux Software Engineer
Open Source Technology Center, Intel



-----Original Message-----
From: openembedded-core-bounces@lists.openembedded.org [mailto:openembedded=
-core-bounces@lists.openembedded.org] On Behalf Of Carlos Rafael Giani
Sent: Monday, September 30, 2013 12:49 AM
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] Questions about Orc and GStreamer

Hello,

I have noticed that Orc is still not part of OE-core.
Is it still possible to move it into Dora? It would be useful for GStreamer=
 and other projects that seem to be using it.

And, I am preparing patches for updating GStreamer 1.0 to version 1.2.
I hope this update is still possible in the current M5 phase..

cheers
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-core

