Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id BE475784CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 16:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4296320B7A;
	Fri, 16 Jun 2017 16:41:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WhR_s2ts0A7x; Fri, 16 Jun 2017 16:41:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C1EA207A3;
	Fri, 16 Jun 2017 16:41:50 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A67DA162504; Fri, 16 Jun 2017 12:41:49 -0400 (EDT)
Date: Fri, 16 Jun 2017 12:41:49 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <20170616164149.GJ28053@denix.org>
References: <1497627437-1903-1-git-send-email-lgonzalez@us.ibm.com>
	<20170616160130.1043.88925@do.openembedded.org>
	<20170616160902.GH28053@denix.org>
	<1497630202.29576.29.camel@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <1497630202.29576.29.camel@linux.intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 16 Jun 2017 16:41:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 16, 2017 at 11:23:22AM -0500, Leonardo Sandoval wrote:
> On Fri, 2017-06-16 at 12:09 -0400, Denys Dmytriyenko wrote:
> > On Fri, Jun 16, 2017 at 04:01:30PM -0000, Patchwork wrote:
> > > == Series Details ==
> > > 
> > > Series: Add service file and systemd package config to rngd
> > > Revision: 1
> > > URL   : https://patchwork.openembedded.org/series/7298/
> > > State : failure
> > > 
> > > == Summary ==
> > > 
> > > 
> > > Thank you for submitting this patch series to OpenEmbedded Core. This is
> > > an automated response. Several tests have been executed on the proposed
> > > series by patchtest resulting in the following failures:
> > > 
> > > 
> > > 
> > > * Patch            Add service file and systemd package config to rngd
> > >  Issue             Shortlog does not follow expected format [test_shortlog_format] 
> > >   Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"
> > 
> > For more details:
> > https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
> 
> I believe is time to add that URL on the patchwork email!

Finally! :) As I had requested this before...
The same URL can be used for missing S-o-B or Upstream-Status lines.


> > > If you believe any of these test results are incorrect, please reply to the
> > > mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> > > Otherwise we would appreciate you correcting the issues and submitting a new
> > > version of the patchset if applicable. Please ensure you add/increment the
> > > version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> > > [PATCH v3] -> ...).
> > > 
> > > ---
> > > Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> > > Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> > > 
> > > -- 
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 

