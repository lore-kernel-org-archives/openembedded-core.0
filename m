Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5FF3260167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 14:14:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 22 Apr 2015 07:14:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,623,1422950400"; d="scan'208";a="717483933"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 22 Apr 2015 07:14:19 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D22286A408D;
	Wed, 22 Apr 2015 07:13:51 -0700 (PDT)
Date: Wed, 22 Apr 2015 17:14:11 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Message-ID: <20150422141411.GA8275@linux.intel.com>
References: <1429541663-5695-1-git-send-email-adrian.freihofer@gmail.com>
	<20150420182134.GA15567@linux.intel.com>
	<1429561646.14219.78.camel@gmail.com>
	<20150421101048.GA26939@linux.intel.com>
	<1429652884.1942.42.camel@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1429652884.1942.42.camel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [master-next][PATCHv2] wic: Add plugin for single partition disk
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
X-List-Received-Date: Wed, 22 Apr 2015 14:14:19 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 21, 2015 at 11:48:04PM +0200, Adrian Freihofer wrote:
> So far I did not recognize the MACHINE dependent behavior you mentioned
> in your email. Thanks for the hint. May be wic has already a complexity
> demanding for unit tests...
> 
Be my guest :) http://lists.openembedded.org/pipermail/openembedded-core/2015-April/103590.html

> Thanks for your support! I hope the updated patch fulfills the
> requirements.
I'll go and review it right away.

Regards,
Ed

