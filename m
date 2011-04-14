Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <qing.he@intel.com>) id 1QADGU-0008IH-3j
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Apr 2011 05:30:42 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Apr 2011 20:28:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,208,1301900400"; d="scan'208";a="733108067"
Received: from qhe2-db.sh.intel.com ([10.239.13.48])
	by orsmga001.jf.intel.com with ESMTP; 13 Apr 2011 20:28:24 -0700
Received: from qhe2 by qhe2-db.sh.intel.com with local (Exim 4.71)
	(envelope-from <qing.he@intel.com>)
	id 1QAD6z-0005mB-95; Thu, 14 Apr 2011 11:20:53 +0800
Date: Thu, 14 Apr 2011 11:20:53 +0800
From: Qing He <qing.he@intel.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20110414032053.GB21398@qhe2-db>
References: <cover.1302686656.git.qing.he@intel.com>
	<e97fe275402062a86c56f70560b9660786d07db7.1302686656.git.qing.he@intel.com>
	<BANLkTi=X7oZBjqnnrqFQe8=cca0pdtPJhQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTi=X7oZBjqnnrqFQe8=cca0pdtPJhQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] sat-solver: fix arch=all packages
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
X-List-Received-Date: Thu, 14 Apr 2011 03:30:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, 2011-04-13 at 23:38 +0800, Khem Raj wrote:
> On Wed, Apr 13, 2011 at 2:26 AM, Qing He <qing.he@intel.com> wrote:
> > From: Qing He <qing.he@intel.com>
> >
> > add a new options to set noarch archs as all so platform independent
> > packages can be recognized and installed.
> >
> 
> I think this patch does not belong to oe-core as it seems distro specific

Ah, you're right. Thank you to point out.

Thanks,
Qing


