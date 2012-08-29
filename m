Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1T6kAL-0000WC-3Z
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 17:26:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2012 08:14:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,334,1344236400"; d="scan'208";a="215338779"
Received: from unknown (HELO [10.255.13.33]) ([10.255.13.33])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2012 08:14:30 -0700
Message-ID: <1346253269.18516.9.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 29 Aug 2012 10:14:29 -0500
In-Reply-To: <1346281338.3283.1.camel@ted>
References: <cover.1346166469.git.sgw@linux.intel.com>
	<1346281338.3283.1.camel@ted>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED REQUEST 00/15] Misc Fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Aug 2012 15:26:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-08-29 at 16:02 -0700, Richard Purdie wrote:
> On Tue, 2012-08-28 at 08:11 -0700, Saul Wold wrote:
> > Richard,
> > 
> > This includes some build related fixes for perf along with
> > the cleanup's in the archiver from Robert.
> > 
> > There are also 2 changes for meta-yocto pending (one left over
> > from Tom bsp-yocto set, and a local.conf.sample.extended for
> > the achiver class changes).
> > 
> > I removed the kernel updates and one of your patches due to 
> > failures.
> 
> Merged to master, thanks.
> 

Looks like this one got missed again:

http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=stage/master_under_test&id=0ccc4a5a72b7af73119e7c9e2d4b2ccd50ec3b05

Tom

> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core




