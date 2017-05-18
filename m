Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 84A9077FC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 16:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C049320B54;
	Thu, 18 May 2017 16:45:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id oEpDIlnhOcWu; Thu, 18 May 2017 16:45:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 97DB1204E0;
	Thu, 18 May 2017 16:45:33 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 23A381624C7; Thu, 18 May 2017 12:45:33 -0400 (EDT)
Date: Thu, 18 May 2017 12:45:33 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170518164533.GT28053@denix.org>
References: <1495098950-18824-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAJTo0LbAX6DHYZUNUH1bzJF3a7xaK0o5RPX4jXBzTXDhAvUZXg@mail.gmail.com>
	<97F7C8E70D26E94FA7E05578493F65C60DFAF522@G08CNEXMBPEKD03.g08.fujitsu.local>
	<CAJTo0LbjrBN9oJa8UK5Ec_4Aw2xYNYFFBLgCY0-R8JEDU4dERQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbjrBN9oJa8UK5Ec_4Aw2xYNYFFBLgCY0-R8JEDU4dERQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] libnl: 3.2.29 -> 3.3.0
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
X-List-Received-Date: Thu, 18 May 2017 16:45:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 18, 2017 at 11:19:09AM +0100, Burton, Ross wrote:
> On 18 May 2017 at 11:03, Huang, Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> 
> > I fixed this error by myself, so it don't have Upstream-Status.
> >
> >
> Yes, you do.  Have you submitted it upstream? (then, Submitted).  Is it
> appropriate upstream at all, or is it customisation (Inappropriate).  If
> you wrote the patch, it needs to go upstream but you haven't yet, then
> Pending.
> 
> Ideally we want Submitted/Backport/Inappropriate, but we've a worrying
> number of Pending.  Please send it upstream.

We have a nice Wiki with all this explained:

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

-- 
Denys

