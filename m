Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 253E377DCA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 15:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 03E0320BA9;
	Tue, 11 Jul 2017 15:35:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id IOOo8Tlo8mh5; Tue, 11 Jul 2017 15:35:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D421D207AF;
	Tue, 11 Jul 2017 15:35:21 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 77A63162526; Tue, 11 Jul 2017 11:35:21 -0400 (EDT)
Date: Tue, 11 Jul 2017 11:35:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Lev Iserovich <Lev.Iserovich@deshawresearch.com>
Message-ID: <20170711153521.GG26405@denix.org>
References: <3656d37e-dbf1-5664-a175-d4863c80ebd6@deshawresearch.com>
	<20170710213119.2381.49390@do.openembedded.org>
	<2753237e-e5ce-54e8-5a45-2dea9fed8899@deshawresearch.com>
MIME-Version: 1.0
In-Reply-To: <2753237e-e5ce-54e8-5a45-2dea9fed8899@deshawresearch.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdldHRleHQ6IEVuYWJsZSBnZW5lcmF0aW9uIG9mIGxpYmFzcHJpbnRmIGluIGdldHRleHQgMC4xOQ==?=
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
X-List-Received-Date: Tue, 11 Jul 2017 15:35:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Your patch is simply corrupted - please use git to send it, not a regular MUA.


On Tue, Jul 11, 2017 at 11:10:11AM -0400, Lev Iserovich wrote:
> Can anyone help me with undestanding this - I'm confused by this
> patchwork failure.
> The patch applies just fine on top of master - my patch was based on
> top of the commit with the hash referenced by patchwork below.
> 
> Thanks,
> 
> Lev Iserovich
> 
> On 07/10/2017 05:31 PM, Patchwork wrote:
> >== Series Details ==
> >
> >Series: gettext: Enable generation of libasprintf in gettext 0.19
> >Revision: 1
> >URL   : https://patchwork.openembedded.org/series/7657/
> >State : failure
> >
> >== Summary ==
> >
> >
> >Thank you for submitting this patch series to OpenEmbedded Core. This is
> >an automated response. Several tests have been executed on the proposed
> >series by patchtest resulting in the following failures:
> >
> >
> >
> >* Issue             Series does not apply on top of target branch [test_series_merge_on_head]
> >   Suggested fix    Rebase your series on top of targeted branch
> >   Targeted branch  master (currently at 7dd5dfc4d5)
> >
> >
> >
> >If you believe any of these test results are incorrect, please reply to the
> >mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
> >Otherwise we would appreciate you correcting the issues and submitting a new
> >version of the patchset if applicable. Please ensure you add/increment the
> >version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
> >[PATCH v3] -> ...).
> >
> >---
> >Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
> >Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe
> >
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

