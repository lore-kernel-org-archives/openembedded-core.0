Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id B967571A84
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 19:40:11 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Jan 2017 11:40:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,279,1477983600"; d="scan'208";a="34909761"
Received: from hnguy31-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.186.17])
	by orsmga002.jf.intel.com with ESMTP; 24 Jan 2017 11:40:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>
Date: Wed, 25 Jan 2017 08:40:08 +1300
Message-ID: <26525175.QT5fsyPLfX@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/5.3.3 (Linux/4.9.4-201.fc25.x86_64; KDE/5.29.0; x86_64; ; )
In-Reply-To: <20170121145337.23273.66790@do.openembedded.org>
References: <1485009344-3664-1-git-send-email-richard.purdie@linuxfoundation.org>
	<20170121145337.23273.66790@do.openembedded.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICJSZXZlcnQgInBvcHVsYXRlX3Nka19leHQ6IHdoaXQuLi4iIGFuZCA2IG1vcmU=?=
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
X-List-Received-Date: Tue, 24 Jan 2017 19:40:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, 21 January 2017 2:53:37 PM NZDT Patchwork wrote:
> == Series Details ==
> 
> Series: "Revert "populate_sdk_ext: whit..." and 6 more
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/4888/
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
> * Patch            [1/7] Revert "populate_sdk_ext: whitelist do_package
> tasks" Issue             Patch is missing Signed-off-by
> [test_signed_off_by_presence] Suggested fix    Sign off the patch (either
> manually or with "git commit --amend -s")

Leo, we need to skip this test for patches whose shortlog starts with "Revert 
". Could you take care of that?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

