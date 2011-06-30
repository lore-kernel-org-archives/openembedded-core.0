Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Qc56F-0004MF-Ju
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 02:27:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2011 17:23:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,446,1304319600"; d="scan'208";a="21710190"
Received: from unknown (HELO [10.255.13.240]) ([10.255.13.240])
	by orsmga001.jf.intel.com with ESMTP; 29 Jun 2011 17:23:35 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 17:23:30 -0700
In-Reply-To: <000E4B57-AB90-4BF8-80B2-8698FEC51AA3@dominion.thruhere.net>
References: <cover.1309383978.git.josh@linux.intel.com>
	<000E4B57-AB90-4BF8-80B2-8698FEC51AA3@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2 (3.0.2-2.fc15) 
Message-ID: <1309393415.24735.19.camel@scimitar>
Mime-Version: 1.0
Subject: Re: [RFC 0/2] Sanity check network connectivity
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
X-List-Received-Date: Thu, 30 Jun 2011 00:27:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-06-30 at 00:00 +0200, Koen Kooi wrote:
> Op 29 jun 2011, om 23:55 heeft Joshua Lock het volgende geschreven:
> 
> > v3 of this change set based on extra feedback from Khem Raj.
> > Changes since v2:
> > * Remove references to Yocto, don't offer default uri's to check
> 
> Can't you offer an oe.org url to check instead?

Can we? Sure. Should we? I don't know...

If this is deemed desirable perhaps we'll need some small uri's to fetch
from and test at least http, https and git fetches. Any suggestions?

Could this be a follow on patch?

Joshua
-- 
Joshua Lock
        Yocto Project "Johannes factotum"
        Intel Open Source Technology Centre



