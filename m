Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RdJeV-0004kZ-13
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 11:44:03 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 21 Dec 2011 02:36:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="49339274"
Received: from unknown (HELO helios.localnet) ([10.252.122.36])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Dec 2011 02:36:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: edwin.zhai@intel.com
Date: Wed, 21 Dec 2011 10:36:54 +0000
Message-ID: <2254819.M8CecAPdr1@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <bb425c648fb30fa14fe5981b5c8bba8e8cf6ba5d.1324454963.git.edwin.zhai@intel.com>
References: <cover.1324454963.git.edwin.zhai@intel.com>
	<bb425c648fb30fa14fe5981b5c8bba8e8cf6ba5d.1324454963.git.edwin.zhai@intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] minix-session: Add this recipe as the session file for mini X
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
X-List-Received-Date: Wed, 21 Dec 2011 10:44:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Edwin,

On Wednesday 21 December 2011 16:18:05 edwin.zhai@intel.com wrote:
> From: Zhai Edwin <edwin.zhai@intel.com>
> 
> minix-session runs session files on behalf of file owner, so that no
> rootless X required.

A bit of a minor nitpick I know, but since "minix" is already the name of a 
well-known operating system I would suggest changing this to mini-x-session or 
similar.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


