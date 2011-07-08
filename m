Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Qf7kC-0007el-SZ
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 11:53:09 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2011 02:49:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,498,1304319600"; d="scan'208";a="23072647"
Received: from unknown (HELO helios.localnet) ([10.255.17.130])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2011 02:49:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: celston@katalix.com, "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 10:49:13 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1310044227.git.paul.eggleton@linux.intel.com>
	<201107080938.37370.paul.eggleton@linux.intel.com>
	<1310114794.3629.7.camel@ce-laptop>
In-Reply-To: <1310114794.3629.7.camel@ce-laptop>
MIME-Version: 1.0
Message-Id: <201107081049.13142.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 1/2] bitbake.conf: update OLDEST_KERNEL to 2.6.0
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
X-List-Received-Date: Fri, 08 Jul 2011 09:53:09 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 08 July 2011 09:46:34 Chris Elston wrote:
> It's very rare that we get a free hand in the choice of kernel version.
> We get stuck with whichever version the silicon vendor chooses to
> support, so it would be bad for us if we couldn't use an older kernel in
> our layers.

Just out of interest, what's the oldest kernel you have to deal with in your 
current/recent projects?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


