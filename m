Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id A152C70057
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Oct 2017 16:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D42D7208D4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Oct 2017 16:50:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id cMuzi3ZzeFQZ
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Oct 2017 16:50:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BB85C207BA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Oct 2017 16:50:09 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 53D5A162705; Sun, 29 Oct 2017 12:50:09 -0400 (EDT)
Date: Sun, 29 Oct 2017 12:50:09 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Message-ID: <20171029165009.GD9221@denix.org>
References: <1508284290-137033-1-git-send-email-denis@denix.org>
	<20171019201500.2783.31176@do.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20171019201500.2783.31176@do.openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIHdheWxhbmQtcHJvdG9jb2xzOiB1cGdyYWRlIHRvIDEuMTEgKHJldjIp?=
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
X-List-Received-Date: Sun, 29 Oct 2017 16:50:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Oct 19, 2017 at 08:15:00PM -0000, Patchwork wrote:
> == Series Details ==
> 
> Series: wayland-protocols: upgrade to 1.11 (rev2)
> Revision: 2
> URL   : https://patchwork.openembedded.org/series/9332/
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
>   Targeted branch  master (currently at 3b413a8057)

As commit log already says:

> This is on top of ross/mut, since usesysrootprefixforpkgdatadirvariable.patch
> is not yet in master

-- 
Denys

