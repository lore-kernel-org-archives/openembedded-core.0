Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 871A17822A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 14:19:33 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Jul 2017 07:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,407,1496127600"; d="scan'208";a="130440608"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga005.fm.intel.com with ESMTP; 24 Jul 2017 07:19:15 -0700
Message-ID: <1500906466.2230.16.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Date: Mon, 24 Jul 2017 09:27:46 -0500
In-Reply-To: <20170724124450.4ta2qpzta6u2gqa5@mentor.com>
References: <1500875919-24477-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<20170724060111.2381.24733@do.openembedded.org>
	<20170724124450.4ta2qpzta6u2gqa5@mentor.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHJhZHZkOiAyLjE0IC0+IDIuMTc=?=
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
X-List-Received-Date: Mon, 24 Jul 2017 14:19:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-07-24 at 08:44 -0400, Joe MacDonald wrote:
> Please note that the advice from patchtest, in this case, may be
> misleading.  The main issue, I think, is this went to the wrong mailing
> list.
> 
You are right, message is misleading. There was a problem with the test
that checks the correct mailing list, hopefully future messages will
provide better info.

Leo


> -J.
> 
> [[OE-core] ✗ patchtest: failure for radvd: 2.14 -> 2.17] On 17.07.24 (Mon 06:01) Patchwork wrote:
> 
> > == Series Details ==
> > 
> > Series: radvd: 2.14 -> 2.17
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/7876/
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
> >   Targeted branch  master (currently at 514e9be6b0)
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
> > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> > 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



