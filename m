Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 293FE71A39
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 02:57:17 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 22 Mar 2017 19:57:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,207,1486454400"; d="scan'208";a="79649649"
Received: from ksompon-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.128])
	by fmsmga005.fm.intel.com with ESMTP; 22 Mar 2017 19:57:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>
Date: Thu, 23 Mar 2017 15:57:14 +1300
Message-ID: <6135390.NMCEsh2eSl@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <20170322205331.6648.75789@do.openembedded.org>
References: <cover.1490188583.git.ed.bartosh@linux.intel.com>
	<20170322205331.6648.75789@do.openembedded.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yICMxMDYxODogSW5jcmVhc2Ugb2Utc2VsZnRlc3QgY292ZXJhZ2Ugb2Ygd2ljIGNvZGViYXNlIChmaXJzdCBwYXJ0KQ==?=
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
X-List-Received-Date: Thu, 23 Mar 2017 02:57:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Leo,

On Thursday, 23 March 2017 9:53:31 AM NZDT Patchwork wrote:
> == Series Details ==
> 
> Series: #10618: Increase oe-selftest coverage of wic codebase (first part)
> Revision: 1
> URL   : https://patchwork.openembedded.org/series/5923/
> State : failure
> 
> == Summary ==
> 
> 
> Thank you for submitting this patch series to OpenEmbedded Core. This is
> an automated response. Several tests have been executed on the proposed
> series by patchtest resulting in the following results:
> 
> 
> 
> * Issue             [pretest_src_uri_checksums_not_changed]
> 
> * Issue             No modified recipes, skipping pretest
> [pretest_src_uri_left_files]
> 
> * Issue             No added or modified recipes, skipping pretest
> [pretest_lic_files_chksum_modified_not_mentioned]
> 
> * Issue             [pretest_pylint]
> 
> * Issue             [test_max_line_length]
> 
> * Issue             [test_cve_presence_in_commit_message]
> 
> * Issue             [test_cve_tag_format]
> 
> * Issue             [test_shortlog_format]
> 
> * Issue             [test_shortlog_length]
> 
> * Issue             [test_summary_presence]
> 
> * Issue             [test_upstream_status_format]
> 
> * Issue             There are no new software patches, no reason to test
> Upstream-Status presence [test_upstream_status_presence]
> 
> * Issue             Until general agreement with the community, disabling it
> [test_commit_message_presence]
> 
> * Issue             [test_mbox_format]
> 
> * Issue             [test_series_merge_on_head]
> 
> * Issue             [test_src_uri_checksums_not_changed]
> 
> * Issue             No modified recipes, skipping pretest
> [test_src_uri_left_files]
> 
> * Issue             [test_bugzilla_entry_format]
> 
> * Issue             [test_signed_off_by_presence]
> 
> * Issue             There are no new software patches, no reason to test
> Signed-off-by presence [test_signed_off_by_presence]
> 
> * Issue             Series merged, no reason to check other mailing lists
> [test_target_mailing_list]
> 
> * Issue             No modified or added recipes, skipping test
> [test_lic_files_chksum_modified_not_mentioned]
> 
> * Issue             No added recipes, skipping test
> [test_lic_files_chksum_presence]
> 
> * Issue             [test_pylint]
> 
> * Issue             [test_author_valid]

These results look a bit broken - some are skipped and really shouldn't be 
showing at all. Was the script invoked in a different way to normal?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

