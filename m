Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 6B80F6CC7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 09:33:04 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 02:33:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1079,1371106800"; d="scan'208";a="373385663"
Received: from unknown (HELO helios.localnet) ([10.252.120.209])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 02:33:03 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Denys Dmytriyenko <denis@denix.org>,
	"Franklin S. Cooper Jr" <fcooper@ti.com>
Date: Fri, 11 Oct 2013 10:33:03 +0100
Message-ID: <25585713.fM0EC1xtYq@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1398912.rgWHutAkox@helios>
References: <1380045500-10798-1-git-send-email-fcooper@ti.com>
	<20131004184116.GA8393@denix.org> <1398912.rgWHutAkox@helios>
MIME-Version: 1.0
Cc: Darren Hart <dvhart@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [for dylan][PATCH] kernel.bbclass: Correct post(inst|rm) package association
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
X-List-Received-Date: Fri, 11 Oct 2013 09:33:04 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 04 October 2013 23:56:18 Paul Eggleton wrote:
> On Friday 04 October 2013 14:41:16 Denys Dmytriyenko wrote:
> > Ping. Is Dylan still alive?
> 
> It is yes. I pushed a paule/dylan-next poky-contrib branch the other day
> including this fix but haven't had a chance to run it through the
> autobuilder yet (been busy with 1.5 work). Will try to get it done next
> week.

FYI the patch has now been merged to the dylan branch along with a few other 
fixes.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

