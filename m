Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0888C78430
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 06:45:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2018 22:45:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,463,1511856000"; d="scan'208";a="24870985"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.20.239])
	([10.221.20.239])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2018 22:45:33 -0800
To: openembedded-core@lists.openembedded.org
References: <1517811692-28225-1-git-send-email-anuj.mittal@intel.com>
	<20180205063303.15543.94254@do.openembedded.org>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <759310a6-a749-80d2-04e0-db88983ba188@intel.com>
Date: Mon, 5 Feb 2018 14:45:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180205063303.15543.94254@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJtYWludGFpbmVycy5pbmM6IHVwZGF0ZSBvd25lcnMuLi4iIGFuZCAyIG1vcmU=?=
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
X-List-Received-Date: Mon, 05 Feb 2018 06:45:34 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02/05/2018 02:33 PM, Patchwork wrote:
> == Series Details ==
> 
> Series: "maintainers.inc: update owners..." and 2 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/10843/
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
>   Targeted branch  master (currently at a0988c3374)
> 

This is probably because I have based my patch on top of a
maintainers.inc change that is already in ross/mut.

Thanks,
Anuj

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
> Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> 


