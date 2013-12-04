Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 191126D99E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 12:42:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Dec 2013 04:42:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,824,1378882800"; d="scan'208";a="446704076"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.121.234])
	by orsmga002.jf.intel.com with ESMTP; 04 Dec 2013 04:42:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Gary Thomas <gary@mlbassoc.com>
Date: Wed, 04 Dec 2013 12:42:04 +0000
Message-ID: <2434662.aE0jBTUbiS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <529F2028.3080702@mlbassoc.com>
References: <1383149365-30556-1-git-send-email-gary@mlbassoc.com>
	<529F2028.3080702@mlbassoc.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] core-image-basic.bb: Allow user extensions
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
X-List-Received-Date: Wed, 04 Dec 2013 12:42:24 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Gary,

On Wednesday 04 December 2013 05:29:28 Gary Thomas wrote:
> On 2013-10-30 10:09, Gary Thomas wrote:
> > Allow the user to provide additional packages to this image.
> > This lets core-image-basic behave like all other core-image*
> > recipes (which do support CORE_IMAGE_EXTRA_INSTALL), as well
> > as match the documentation which suggests this as the mode to
> > extend any core-image* image.
>...
> 
> Ping?  I know this message made it to the list, just no action.

It was merged some time ago:

http://cgit.openembedded.org/openembedded-core/commit/?id=5faabf398819d40b55c46bc83ae03942d115024b

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

