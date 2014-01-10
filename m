Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFBE6BC1F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 14:01:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jan 2014 06:01:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,638,1384329600"; d="scan'208";a="436908169"
Received: from unknown (HELO helios.localnet) ([10.252.122.146])
	by orsmga001.jf.intel.com with ESMTP; 10 Jan 2014 06:01:23 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Jan 2014 14:01:21 +0000
Message-ID: <36564971.Qsvan2fIrZ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-35-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52CEEE43.1090209@linaro.org>
References: <52CEEE43.1090209@linaro.org>
MIME-Version: 1.0
Subject: Re: unmaintained layers
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
X-List-Received-Date: Fri, 10 Jan 2014 14:01:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 09 January 2014 13:45:23 Trevor Woerner wrote:
> At the last TSC meeting the topic of unmaintained layers came up. Here
> is the sorted list of master layers from the layer index [1], would it
> be possible for those in the know to indicate which layers are, or are
> suspected of being, unmaintained?

This is all very interesting with people piping up that their layers are 
maintained, but I'm not sure it helps solve the overall problem.

We have some immediate issues with patches to particular layers going 
unmerged. That's in the process of being resolved.

However, looking to the future it was suggested at the TSC meeting it would be 
nice to have some kind of measure or indication for the layer (ideally in the 
layer index) as to how well-maintained it is. Is there a practical and 
objective measurement we can have about the layer's maintenance status? I 
don't have a good idea of what this would actually mean - how many outstanding 
patches it has? How recently it has been built/tested?

Also, if it does appear that a layer has gone "unmaintained" by popular 
consensus, what should actually be done about it?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

