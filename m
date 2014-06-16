Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1005560889;
	Mon, 16 Jun 2014 08:49:02 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 Jun 2014 01:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,485,1400050800"; d="scan'208";a="445934955"
Received: from lakaruna-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.8])
	by azsmga001.ch.intel.com with ESMTP; 16 Jun 2014 01:48:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Mon, 16 Jun 2014 09:48:58 +0100
Message-ID: <6076930.voh3DpIb8j@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.6-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <539E8F97.3070508@dresearch-fe.de>
References: <1402775049-3165-1-git-send-email-sledz@dresearch-fe.de>
	<539E8F97.3070508@dresearch-fe.de>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][daisy][PATCH] live555: fix fetch problem
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
X-List-Received-Date: Mon, 16 Jun 2014 08:49:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Steffen,

On Monday 16 June 2014 08:32:55 Steffen Sledz wrote:
> What is the right ML address for patches in this area?
> 
> The meta-multimedia/README in git://git.openembedded.org/meta-openembedded
> (daisy branch) says:
> 
>   "Send pull requests to openembedded-devel@lists.openembedded.org"
> 
> But i believe this should be openembedded-core@lists.openembedded.org.

No, for all layers in the meta-openembedded repository it should be 
openembedded-devel as listed.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

