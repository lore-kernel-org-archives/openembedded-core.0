Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 9092A6A4AC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 15:22:19 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 31 Jul 2013 08:22:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,788,1367996400"; d="scan'208";a="339600044"
Received: from unknown (HELO helios.localnet) ([10.252.122.226])
	by azsmga001.ch.intel.com with ESMTP; 31 Jul 2013 08:22:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:22:18 +0100
Message-ID: <2820820.TAGXFEgGOg@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <cover.1375176217.git.stefanx.stanacar@intel.com>
References: <cover.1375176217.git.stefanx.stanacar@intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] Small tweaks for testimage
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
X-List-Received-Date: Wed, 31 Jul 2013 15:22:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 30 July 2013 12:28:16 Stefan Stanacar wrote:
> Changed in v2:
>  - 4/4 had an extra change that wasn't meant to be.
> 
> The following changes since commit bd1c441a210cae03fb6006c996227211cc29056b:
> 
>   bitbake: bitbake: runqueue: add warning if invalidating invalid task
> (2013-07-29 15:25:09 +0100)
> 
> are available in the git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib stefans/testimage-fix1
> 
> for you to fetch changes up to 42a3f746ec638bfb4802ccc4c10f0cbd09de958e:
> 
>   oeqa/runtime/xorg: use the right ps command for xorg test (2013-07-30
> 11:59:30 +0300)
> 
> ----------------------------------------------------------------
> Stefan Stanacar (4):
>       oeqa/utils/sshcontrol: increase and log timeout in output
>       oeqa/utils/qemurunner: add comment and header
>       oeqa/utils/qemurunner: tweak console bootparam and ip command
>       oeqa/runtime/xorg: use the right ps command for xorg test

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

