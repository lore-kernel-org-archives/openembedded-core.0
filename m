Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QfEBx-0003gl-Ng
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:46:13 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 08 Jul 2011 09:36:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,500,1304319600"; d="scan'208";a="24504818"
Received: from unknown (HELO helios.localnet) ([10.255.17.130])
	by azsmga001.ch.intel.com with ESMTP; 08 Jul 2011 09:36:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jul 2011 17:36:11 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<201107081708.20895.paul.eggleton@linux.intel.com>
	<1310142151.20015.902.camel@rex>
In-Reply-To: <1310142151.20015.902.camel@rex>
MIME-Version: 1.0
Message-Id: <201107081736.11906.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 6/8] cmake: add nativesdk and target versions
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
X-List-Received-Date: Fri, 08 Jul 2011 16:46:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 08 July 2011 17:22:31 Richard Purdie wrote:
> On Fri, 2011-07-08 at 17:08 +0100, Paul Eggleton wrote:
> > Yes, and I don't like it there either. Suggestions on fixing this would
> > be welcome - in the time I spent trying to figure out why it wasn't
> > working (some months ago) I couldn't find the cause.
> 
> Ok, I'm not happy but I guess this can go as is for now.
> 
> Paul: Can you open a bug against that being needed please?

Done:
http://bugzilla.pokylinux.org/show_bug.cgi?id=1231

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


