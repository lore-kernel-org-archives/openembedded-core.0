Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2AB5F78418
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:14:19 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Jun 2017 09:14:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,347,1493708400"; d="scan'208";a="1183400308"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2017 09:14:20 -0700
Message-ID: <1497630202.29576.29.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Denys Dmytriyenko <denis@denix.org>
Date: Fri, 16 Jun 2017 11:23:22 -0500
In-Reply-To: <20170616160902.GH28053@denix.org>
References: <1497627437-1903-1-git-send-email-lgonzalez@us.ibm.com>
	<20170616160130.1043.88925@do.openembedded.org>
	<20170616160902.GH28053@denix.org>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Leonel Gonzalez <lgonzalez@us.ibm.com>,
	openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIEFkZCBzZXJ2aWNlIGZpbGUgYW5kIHN5c3RlbWQgcGFja2FnZSBjb25maWcgdG8gcm5nZA==?=
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
X-List-Received-Date: Fri, 16 Jun 2017 16:14:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-06-16 at 12:09 -0400, Denys Dmytriyenko wrote:
> On Fri, Jun 16, 2017 at 04:01:30PM -0000, Patchwork wrote:
> > == Series Details ==
> > 
> > Series: Add service file and systemd package config to rngd
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/7298/
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
> > * Patch            Add service file and systemd package config to rngd
> >  Issue             Shortlog does not follow expected format [test_shortlog_format] 
> >   Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"
> 
> For more details:
> https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines

I believe is time to add that URL on the patchwork email!

> 
> 
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
> > -- 
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core



