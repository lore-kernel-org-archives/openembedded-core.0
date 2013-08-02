Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 52F7C6B22E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2013 10:40:54 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Aug 2013 03:40:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,800,1367996400"; d="scan'208";a="276746537"
Received: from unknown (HELO helios.localnet) ([10.252.122.201])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Aug 2013 03:40:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 02 Aug 2013 11:40:53 +0100
Message-ID: <2803921.ll8rIZ9yu3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <51FB83D9.80904@windriver.com>
References: <cover.1375354695.git.hongxu.jia@windriver.com>
	<2353783.439DWQmp63@helios> <51FB83D9.80904@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] list-packageconfig-flag.py: add a script to list all PACKAGECONFIG's flags
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
X-List-Received-Date: Fri, 02 Aug 2013 10:40:54 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 02 August 2013 18:03:05 Hongxu Jia wrote:
> I have updated the pull branch to rename the script and correct the comments
> as your suggestions.

There still seem to be a lot of instances of "PACKAGECONFIG's flags" on the 
branch.

> The suggestion about using bitbake parser to make the script more robust,
> I need some time to do the investigation and I am very pleased to do that,
> I will address this in follow-up pathch, would you think it's proper or not?

Yes, that's fine.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

