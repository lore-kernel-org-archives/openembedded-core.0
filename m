Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AB0E860D0E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 20:56:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jan 2014 12:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,592,1384329600"; d="scan'208";a="433164921"
Received: from unknown (HELO helios.localnet) ([10.252.122.88])
	by orsmga001.jf.intel.com with ESMTP; 02 Jan 2014 12:56:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Thu, 02 Jan 2014 20:56:26 +0000
Message-ID: <5263086.KLRCisNdLW@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-34-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 00/38] Cleanup series
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
X-List-Received-Date: Thu, 02 Jan 2014 20:56:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday 28 December 2013 22:28:56 Paul Eggleton wrote:
> I got a bit tired of seeing poor SUMMARY and DESCRIPTION values in our
> recipes, so I went on a bit of a quest to clean them up, and ended up
> tidying up a few other things in the process.
> 
> This touches quite a few recipes, so I've tried to split the series into
> logical patches to aid review. I built all of the affected recipes and
> skimmed over the changes in pkgdata and they looked reasonable.
> Hopefully all of the changes make sense; I'm happy to have feedback as
> always.
> 
> 
> The following changes since commit 421e927bd453259f4b3cdbd1676f6e12f97bf34f:
> 
>   openssl: use PACKAGECONFIG to disable perl bits (2013-12-21 09:09:22
> +0000)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib paule/cleanup3
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paul
> e/cleanup3

Richard, which branch did you merge for these? It doesn't look like it was 
this one...

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

