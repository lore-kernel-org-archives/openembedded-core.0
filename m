Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R5eUj-0007PR-BX
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Sep 2011 16:06:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Sep 2011 07:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="49900130"
Received: from unknown (HELO helios.localnet) ([10.252.120.110])
	by orsmga001.jf.intel.com with ESMTP; 19 Sep 2011 07:01:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2011 15:01:28 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1316429640.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1316429640.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Message-Id: <201109191501.28698.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/3] Dependency fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Sep 2011 14:06:49 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 19 September 2011 11:58:33 Paul Eggleton wrote:
> Fix three issues due to missing dependency race conditions as shown up on
> the autobuilder.
> 
> The following changes since commit
> 7a0cbe6b0e5185aebabedc515b427994bc2a15dc:
> 
>   cooker.py: Fix key expansion issues in showVersions (2011-09-19 05:55:37
> +0100)
> 
> are available in the git repository at:
>   git://git.pokylinux.org/poky-contrib paule/dep-fixes
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=paule/dep-fixes

So despite our discussion only late last week I still managed to post 
something based on a Poky branch this morning. Sorry about that :(

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


