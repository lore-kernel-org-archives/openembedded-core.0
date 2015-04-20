Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5FCD86E268
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Apr 2015 16:59:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 20 Apr 2015 09:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,610,1422950400"; d="scan'208";a="716389580"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 20 Apr 2015 09:59:24 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.65])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 42EF56A408D;
	Mon, 20 Apr 2015 09:58:59 -0700 (PDT)
Date: Mon, 20 Apr 2015 19:59:18 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Philip Balister <philip@balister.org>
Message-ID: <20150420165918.GA14044@linux.intel.com>
References: <55311968.50404@balister.org>
 <5534F189.3010901@balister.org>
MIME-Version: 1.0
In-Reply-To: <5534F189.3010901@balister.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [wic][PATCH] wic: try to find bitbake using find_executable API
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
X-List-Received-Date: Mon, 20 Apr 2015 16:59:28 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 20, 2015 at 08:31:05AM -0400, Philip Balister wrote:
> I forgot to cc the list. Unfortunately, this led to the commit going in
> with the reference to oe-classic.
> 
> Please people, get your terminology correct. The word soup in the wold
> is insane.
> 

My bad. I've received your e-mail, but didn't have time to send the fix during weekend.
Today I've noticed that my patch was already merged.

--
Regards,
Ed

