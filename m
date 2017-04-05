Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 058F577BD3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 15:13:24 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 05 Apr 2017 08:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,279,1486454400"; d="scan'208";a="1131392439"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga001.fm.intel.com with ESMTP; 05 Apr 2017 08:13:25 -0700
Message-ID: <1491405706.5062.30.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 05 Apr 2017 10:21:46 -0500
In-Reply-To: <20170405130231.6645.91181@do.openembedded.org>
References: <20170405123745.15688-1-dmitry.rozhkov@linux.intel.com>
	<20170405130231.6645.91181@do.openembedded.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHB5dGhvbjM6IGZpeCBydW4tdGltZSBkZXBzIGZvciBjb3JlIHB5dGhvbjMgbGlicmFyaWVz?=
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
X-List-Received-Date: Wed, 05 Apr 2017 15:13:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-04-05 at 13:02 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: python3: fix run-time deps for core python3 libraries
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/6164/
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
> * Issue             Patch line too long (current length 184) [test_max_line_length] 
>   Suggested fix    Shorten the corresponding patch line (max length supported 180)
>   Patch            scripts/contrib/python/generate-manifest-3.5.py
>   Line             +    m.addPackage( "${PN}-netclient", "Python Internet Protocol clients", "${PN} ...


Ignore the above patchtest failure. It has been disabled until general
agreement.


> 
> * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
>   Suggested fix    Rebase your series on top of targeted branch
>   Targeted branch  master (currently at 3b7111b30d)
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



