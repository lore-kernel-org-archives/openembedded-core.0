Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E0CF671BEE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Jun 2017 16:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7432D20879;
	Sun, 11 Jun 2017 16:54:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id uY5EXGAxEG0a; Sun, 11 Jun 2017 16:54:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 53505204E0;
	Sun, 11 Jun 2017 16:54:26 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CBA651624E9; Sun, 11 Jun 2017 12:54:25 -0400 (EDT)
Date: Sun, 11 Jun 2017 12:54:25 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Trevor Woerner <twoerner@gmail.com>
Message-ID: <20170611165425.GO28053@denix.org>
References: <20170611064757.5937-1-twoerner@gmail.com>
	<20170611070133.1039.98132@do.openembedded.org>
	<CAHUNapQpfSojDV5MjE6cewKK39YjQ4d6stbLswCRxhfkG7iBuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHUNapQpfSojDV5MjE6cewKK39YjQ4d6stbLswCRxhfkG7iBuQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIG1lc2EuaW5jOiBwb3RlbnRpYWxseSBlbmFibGUgdGV4dHVyZSBmbG9hdCBmb3IgZ2FsbGl1bQ==?=
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
X-List-Received-Date: Sun, 11 Jun 2017 16:54:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jun 11, 2017 at 03:09:39AM -0400, Trevor Woerner wrote:
> On Sun, Jun 11, 2017 at 3:01 AM, Patchwork
> <patchwork@patchwork.openembedded.org> wrote:
> > * Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence]
> >   Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-graphics/mesa/files/0002-hardware-gloat.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)
> 
> 
> If I didn't write the patch, how am I responsible for its upstream status?

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations

