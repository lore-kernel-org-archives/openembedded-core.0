Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SQ3Ou-00032N-SN
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 23:17:25 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2012 14:07:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="136751436"
Received: from unknown (HELO envy.home) ([10.7.199.57])
	by orsmga001.jf.intel.com with ESMTP; 03 May 2012 14:07:38 -0700
Message-ID: <4FA2F37C.4030107@linux.intel.com>
Date: Thu, 03 May 2012 14:07:08 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<55e8f3e04ef67a706dfc19ed730ae9612489c4e5.1328510188.git.raj.khem@gmail.com>
In-Reply-To: <55e8f3e04ef67a706dfc19ed730ae9612489c4e5.1328510188.git.raj.khem@gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 08/20] module-init-tools: Delete
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
X-List-Received-Date: Thu, 03 May 2012 21:17:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/05/2012 10:40 PM, Khem Raj wrote:
> Since its provided by kmod

Perhaps we should wait on deleting this until we've run with kmod as the
default for a while?

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


