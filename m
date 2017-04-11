Return-Path: <maxin.john@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id F0A9677BE2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Apr 2017 08:13:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 11 Apr 2017 01:13:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,184,1488873600"; d="scan'208";a="72453467"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 11 Apr 2017 01:13:43 -0700
Date: Tue, 11 Apr 2017 11:13:45 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Message-ID: <20170411081344.GA16630@mbabyjoh-desk.ger.corp.intel.com>
References: <20170410205828.93764-1-mark.hatle@windriver.com>
MIME-Version: 1.0
In-Reply-To: <20170410205828.93764-1-mark.hatle@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Restore proper attributions to libsolv patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Apr 2017 08:13:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Mark,

On Mon, Apr 10, 2017 at 03:58:27PM -0500, Mark Hatle wrote:
> 
> Per the email: http://lists.openembedded.org/pipermail/openembedded-core/2017-April/135460.html
> 
> Neal's attribution to the original code was lost.  In addition the original
> two patches were squashed together.  This was not indicated in any change
> information.  Again, making it unclear the proper history of the patches.

My apologies to Neal. I thought preserving the signed-off-by and link to github was
a way to credit the original author, which is technically not correct. 

> The associated change has no technical content change to the patches, it
> is purely cosmetic.  The attempt is to restore the original unmodified
> patches, including all attributions.  Maxim's patch to the if clause
> in one hunk was then restored on top.
> 
> Let me know if there are any questions or concerns with this set.
> 
> (Note, Neal has not provided a signed-off-by line, which is his right as
> an external author.  Since I modified the code, I did not add Maxim's either
> as I do not have the right to add a signed-off-by line by someone else
> without their express permission.)
> 
> Mark Hatle (1):
>   libsolve: 0001-Add-fallback-fopencookie-implementation.patch fix
>     attribution
> 
>  ...1-Add-fallback-fopencookie-implementation.patch | 186 +++++++++++++++++----
>  1 file changed, 150 insertions(+), 36 deletions(-)
>

Best Regards,
Maxin

