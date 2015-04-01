Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id DB7C260034
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 11:20:00 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 Apr 2015 04:19:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,503,1422950400"; d="scan'208";a="673715482"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 01 Apr 2015 04:19:42 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id AE8206A408D;
	Wed,  1 Apr 2015 04:19:20 -0700 (PDT)
Date: Wed, 1 Apr 2015 14:19:36 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20150401111936.GA10151@linux.intel.com>
References: <20150330224732.GA27217@linux.intel.com>
	<1427759396-24932-1-git-send-email-ed.bartosh@linux.intel.com>
	<CAJTo0LYLsPht9UmqOZgHcFwMFftfFi6rRkFyFztHyGChGdwubA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYLsPht9UmqOZgHcFwMFftfFi6rRkFyFztHyGChGdwubA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] createrepo: Implement --dbpath command line option
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: ed.bartosh@linux.intel.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Apr 2015 11:20:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 31, 2015 at 10:25:11PM +0100, Burton, Ross wrote:
> Hi Ed,
> 
> On 31 March 2015 at 00:49, Ed Bartosh <ed.bartosh@linux.intel.com> wrote:
> 
> > Upstream-Status: Pending
> >
> 
> The commit log needs just a Signed-off-by; the patch needs an explanation,
> Signed-off-by, and Upstream-Status.  The goal is that the patch itself is
> self-explanatory, so should explain what it does and why, whether it went
> upstream and why (not), and who admits creating it in the first place.
>
Thanks for the explanations. I'll update the patch.

Regards,
Ed

