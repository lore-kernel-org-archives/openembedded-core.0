Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 732FB784D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 15:51:22 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 07:51:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,395,1505804400"; 
   d="scan'208";a="1463153"
Received: from $_hostname.zpn.intel.com (HELO lsandov1-mobl2.zpn.intel.com)
	([10.219.128.134])
	by fmsmga004.fm.intel.com with ESMTP; 14 Nov 2017 07:51:24 -0800
Date: Tue, 14 Nov 2017 10:01:54 -0600
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Daniel Mack <daniel@zonque.org>
Message-ID: <20171114100154.40735411@lsandov1-mobl2.zpn.intel.com>
In-Reply-To: <c3570720-c03e-9f76-5256-d03d64570d94@zonque.org>
References: <20171114073653.12566-1-daniel@zonque.org>
	<20171114080525.2787.1167@do.openembedded.org>
	<c3570720-c03e-9f76-5256-d03d64570d94@zonque.org>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGNvbm5tYW46IGJ1bXAgdG8gdmVyc2lvbiAxLjM1?=
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
X-List-Received-Date: Tue, 14 Nov 2017 15:51:23 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 14 Nov 2017 15:18:40 +0100
Daniel Mack <daniel@zonque.org> wrote:

> Ha, this exact same patch is already in master-next.
> I must have missed that.
> 
> Sorry for the noise!

'patchtest' checks only stable branches, and what I can see is that this
patch is already on master (From OE-Core rev: f4b9c5dba4ca0c0242284eb8148e25e89f02d988)

> 
> 
> Daniel
> 
> 
> On Tuesday, November 14, 2017 09:05 AM, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: connman: bump to version 1.35
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/9769/
> > State : failure
> > 
> > == Summary ==
> > 
> > 
> > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > an automated response. Several tests have been executed on the proposed
> > series by patchtest resulting in the following failures:
> > 
> > 
> > 
> > * Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at a17f3ec910)
> > 
> > 
> > 
> > If you believe any of these test results are incorrect, please reply to the
> > mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> > Otherwise we would appreciate you correcting the issues and submitting a new
> > version of the patchset if applicable. Please ensure you add/increment the
> > version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> > [PATCH v3] -> ...).
> > 
> > ---
> > Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> >   
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

