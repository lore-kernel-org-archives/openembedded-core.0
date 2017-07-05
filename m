Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 181F0775DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Jul 2017 14:43:05 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Jul 2017 07:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,312,1496127600"; d="scan'208";a="282393128"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga004.fm.intel.com with ESMTP; 05 Jul 2017 07:43:06 -0700
Message-ID: <1499266357.24688.13.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 05 Jul 2017 09:52:37 -0500
In-Reply-To: <20170705123124.2383.65519@do.openembedded.org>
References: <cover.1499256752.git.jussi.kukkonen@intel.com>
	<20170705123124.2383.65519@do.openembedded.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFZ1bGthbiBpbXByb3ZlbWVudHM=?=
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
X-List-Received-Date: Wed, 05 Jul 2017 14:43:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-07-05 at 12:31 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: Vulkan improvements
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/7583/
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
> * Issue             Upstream-Status is in incorrect format [test_upstream_status_format] 
>   Suggested fix    Fix Upstream-Status format in meta/recipes-graphics/vulkan/vulkan-demos/0001-Don-t-build-demos-with-questionably-licensed-data.patch so it is one of: Pending, Submitted, Accepted, Backport, Denied, Inappropriate
> 

Jussi, just checking this issue an apparently you misspelled the
upstream-status. In the other hand, I have improved the output of this
check so it would be easier to see what went wrong (will show current
status and valid ones in separate lines).

Leo

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



