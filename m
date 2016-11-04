Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 7837D719CF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 16:26:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 04 Nov 2016 09:26:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,444,1473145200"; d="scan'208";a="27843317"
Received: from lsandov1-mobl2.zpn.intel.com (HELO [10.219.5.38])
	([10.219.5.38])
	by orsmga004.jf.intel.com with ESMTP; 04 Nov 2016 09:26:09 -0700
To: openembedded-core@lists.openembedded.org,
	daniela.plascencia@linux.intel.com, richard.purdie@linuxfoundation.org, 
	paul.eggleton@linux.intel.com, joshua.g.lock@intel.com,
	sgw@linux.intel.com, benjamin.esquivel@linux.intel.com
References: <1478257606-15637-1-git-send-email-s.mueller-klieser@phytec.de>
	<20161104112557.2206.15124@do.openembedded.org>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <602d414e-b507-c4c8-d5d1-50a1e48df05c@linux.intel.com>
Date: Fri, 4 Nov 2016 10:30:57 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161104112557.2206.15124@do.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHUtYm9vdDogbWtpbWFnZTogZml4IGJ1aWxk?=
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
X-List-Received-Date: Fri, 04 Nov 2016 16:26:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

This is another false positive that has been fixed. Submitted is a valid 
status.


On 11/04/2016 05:25 AM, Patchwork wrote:
> == Series Details ==
>
> Series: u-boot: mkimage: fix build
> URL   : https://patchwork.openembedded.org/series/3768/
> State : failure
>
> == Summary ==
>
> Thank you for your patch submission of the following patch series to OpenEmbedded Core-.
> this is an automated response. Several tests have been executed on the proposed
> series (series 3768, revision 1) by patchtest and the following have failed:
>
>
> Test Name        test_upstream_status_format
> Proposed Fix     Fix Upstream-Status format
> Required format  Upstream-Status: <status>
> Possible Status  Pending, Accepted, Backport, Denied, Inappropriate
> Line             Upstream-Status: Submitted
> Column           18
>
>
> If you believe any of these test results are incorrect, please reply to the mailing
> list (openembedded-core@lists.openembedded.org) raising your concerns. Otherwise we would
> appreciate you correcting the issues and submitting a new version of the patchset if
> applicable. Please ensure you add/increment the version number when sending the new
> version (i.e. [PATCH] -> [PATCH v2] -> [PATCH v3] -> ...).
>
> ---
> Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
>


