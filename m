Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6591D7198A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 21:34:13 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jun 2017 14:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,366,1493708400"; d="scan'208";a="116794991"
Received: from unknown (HELO scetola-mac01.local) ([10.252.131.195])
	by fmsmga005.fm.intel.com with ESMTP; 20 Jun 2017 14:34:13 -0700
Date: Tue, 20 Jun 2017 14:34:13 -0700
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170620213413.GA88738@scetola-mac01.local>
References: <20170619151210.7692-1-zeenix@gmail.com>
	<20170619153127.1043.10102@do.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20170619153127.1043.10102@do.openembedded.org>
User-Agent: Mutt/1.8.3 (2017-05-23)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG9lcWE6IGZpeCBydW50aW1lIHRlc3RpbmcgdXNpbmcgc3lzdGVtZC1ib290IHRhcmdldCAocmV2Mik=?=
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
X-List-Received-Date: Tue, 20 Jun 2017 21:34:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Zeeshan,

Let me know if you need any help with this. This probably requires
that you do a rebase with master and resubmit a V4.

Cheers,
Stephano

On 06/19, Patchwork wrote:
> == Series Details ==
> 
> Series: oeqa: fix runtime testing using systemd-boot target (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/6953/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following failures:
> 
> 
> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 1d9a88f635)
> 
> 
> 
> If you believe any of these test results are incorrect, please reply to the
> mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> Otherwise we would appreciate you correcting the issues and submitting a new
> version of the patchset if applicable. Please ensure you add/increment the
> version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> [PATCH v3] -> ...).
> 
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

