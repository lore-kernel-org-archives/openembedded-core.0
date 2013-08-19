Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 240876B3BA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 08:31:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 19 Aug 2013 01:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,912,1367996400"; d="scan'208";a="389367820"
Received: from unknown (HELO helios.localnet) ([10.252.122.215])
	by orsmga002.jf.intel.com with ESMTP; 19 Aug 2013 01:31:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Cristiana Voicu <cristiana.voicu@intel.com>
Date: Mon, 19 Aug 2013 09:31:22 +0100
Message-ID: <1416445.v9mPbDrrvP@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <2871332.fhu1i0uVde@helios>
References: <cover.1376641437.git.cristiana.voicu@intel.com>
	<f9e441cc3a1beefe5e6463ed1db730f8803af38c.1376641437.git.cristiana.voicu@intel.com>
	<2871332.fhu1i0uVde@helios>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 19 Aug 2013 08:31:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 August 2013 09:24:54 Paul Eggleton wrote:
> Hi Cristiana,
> 
> On Friday 16 August 2013 11:30:49 Cristiana Voicu wrote:
> > LIC_FILES_CHKSUM changed because cron.h doesn't exist anymore.
> > Replaced it with cron.c.
> >
> >...
> 
> A couple of people have reported this doesn't build, and I've confirmed it
> this morning:

Ah, I see Saul already sent a patch for this, sorry I didn't see it before.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

