Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qy6hq-0008Jt-Dp
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 20:37:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Aug 2011 11:32:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="43348768"
Received: from unknown (HELO helios.localnet) ([10.255.18.171])
	by orsmga001.jf.intel.com with ESMTP; 29 Aug 2011 11:32:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 29 Aug 2011 19:32:15 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1314563914.git.paul.eggleton@linux.intel.com>
	<38213ee7d596d7f68544e0513a13d08b7439aece.1314563914.git.paul.eggleton@linux.intel.com>
	<6A276FB3-183D-444F-8AC1-0EC514CB389D@kernel.crashing.org>
In-Reply-To: <6A276FB3-183D-444F-8AC1-0EC514CB389D@kernel.crashing.org>
MIME-Version: 1.0
Message-Id: <201108291932.15632.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/1] binutils: update to 2.21.1a
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
X-List-Received-Date: Mon, 29 Aug 2011 18:37:10 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 29 August 2011 19:14:02 Kumar Gala wrote:
> Don't we need to update:
> 
> meta/conf/distro/include/tcmode-default.inc
> 
> and possibly:
> 
> meta/conf/distro/include/distro_tracking_fields.inc

Ah yes, you're right. Patches coming up for both.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


