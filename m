Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF7376E668
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 08:28:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 04 May 2016 01:28:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="96885808"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 04 May 2016 01:28:27 -0700
Date: Wed, 4 May 2016 11:28:39 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160504082839.GA29983@mbabyjoh-desk.ger.corp.intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
	<20160503164101.GA20238@jama>
	<20160503164557.GA28091@mbabyjoh-desk.ger.corp.intel.com>
	<1787825.IkZ0s2asgU@peggleto-mobl.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <1787825.IkZ0s2asgU@peggleto-mobl.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/10] mc: upgrade to 4.8.16
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
X-List-Received-Date: Wed, 04 May 2016 08:28:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Paul,

On Wed, May 04, 2016 at 05:30:33PM +1200, Paul Eggleton wrote:
> On Tue, 03 May 2016 19:45:57 Maxin B. John wrote:
> > On Tue, May 03, 2016 at 06:41:01PM +0200, Martin Jansa wrote:
> > > On Tue, May 03, 2016 at 05:49:45PM +0300, Maxin B. John wrote:
> > > > 4.8.15 -> 4.8.16
> > > 
> > > Can you please use -M when sending the patches, it's much easier to
> > > review.
> > 
> > Thanks. Noticed it after sending the patch. Sorry for the inconvenience.
> 
> FYI if you use the create/-pull-request/send-pull-request scripts this is 
> taken care of. I believe you can also set this in your git configuration as 
> well:
> git config --global diff.renames true

Thanks for sharing this. Will use the *pull-request scripts next time. Updated
the git config for now. 

> Cheers,
> Paul
> 
> -- 
> 
> Paul Eggleton
> Intel Open Source Technology Centre

Best Regards,
Maxin

