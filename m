Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5D378411
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 19:53:11 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 11 Sep 2017 12:53:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,379,1500966000"; d="scan'208";a="310462019"
Received: from yctb05.ostc.intel.com (HELO yctb05) ([10.54.69.59])
	by fmsmga004.fm.intel.com with ESMTP; 11 Sep 2017 12:53:12 -0700
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Patchwork <patchwork@patchwork.openembedded.org>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
	<20170911190035.2787.74154@do.openembedded.org>
Date: Mon, 11 Sep 2017 12:53:12 -0700
In-Reply-To: <20170911190035.2787.74154@do.openembedded.org> (Patchwork's
	message of "Mon, 11 Sep 2017 19:00:35 -0000")
Message-ID: <5qd16xm2qf.fsf@yctb05>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.0.50 (gnu/linux)
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFJldmFtcCB0aGUgR28gc3VwcG9ydCAocmV2Nyk=?=
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
X-List-Received-Date: Mon, 11 Sep 2017 19:53:11 -0000
Content-Type: text/plain

Patchwork <patchwork@patchwork.openembedded.org> writes:

> == Series Details ==
>
> Series: Revamp the Go support (rev7)
> Revision: 7
> URL   : https://patchwork.openembedded.org/series/8697/
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
> * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence] 
>   Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)
>
patchtest is picky on this check, so '+Upstream-status: Pending' must be
'+Upstream-Status: Pending'


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

