Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 87A98607A4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jul 2016 08:13:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 29 Jul 2016 01:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,438,1464678000"; d="scan'208";a="1004751373"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 29 Jul 2016 01:13:50 -0700
Date: Fri, 29 Jul 2016 11:13:26 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160729081325.GA3826@mbabyjoh-desk.ger.corp.intel.com>
References: <1469624577-24972-1-git-send-email-maxin.john@intel.com>
	<1469624577-24972-7-git-send-email-maxin.john@intel.com>
	<1469775091.9142.41.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1469775091.9142.41.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] glew: upgrade to 2.0.0
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
X-List-Received-Date: Fri, 29 Jul 2016 08:13:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi RP,

On Fri, Jul 29, 2016 at 07:51:31AM +0100, Richard Purdie wrote:
> On Wed, 2016-07-27 at 16:02 +0300, Maxin B. John wrote:
> > 1.13.0 -> 2.0.0
> > 
> > Signed-off-by: Maxin B. John <maxin.john@intel.com>
> > ---
> >  meta/recipes-graphics/glew/{glew_1.13.0.bb => glew_2.0.0.bb} | 4 ++-
> > -
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-graphics/glew/{glew_1.13.0.bb => glew_2.0.0.bb}
> > (90%)
> 
> Failed in testing:
> 
> https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/bui
> lds/883/steps/BuildImages_4/logs/stdio

Thanks, will send the fixed version soon.
> 
> Cheers,
> Richard

Best Regards,
Maxin

