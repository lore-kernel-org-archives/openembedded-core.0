Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by mail.openembedded.org (Postfix) with ESMTP id 8167571545
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 20:42:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCD00CY1G65OL20@vms173023.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 23 Sep 2014 15:42:16 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B04E620357; Tue,
	23 Sep 2014 16:42:05 -0400 (EDT)
Date: Tue, 23 Sep 2014 16:42:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20140923204205.GF2480@denix.org>
References: <1410909001-3284-1-git-send-email-denis@denix.org>
	<1410909001-3284-2-git-send-email-denis@denix.org>
	<20140923202717.GD2480@denix.org>
	<CAJTo0LZv3xoTQ8kX4DXcBTRE5LMgtuWj_D6Kzg_tS5M7W0WuiQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LZv3xoTQ8kX4DXcBTRE5LMgtuWj_D6Kzg_tS5M7W0WuiQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] u-boot: update to version 2014.07
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
X-List-Received-Date: Tue, 23 Sep 2014 20:42:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 23, 2014 at 09:31:43PM +0100, Burton, Ross wrote:
> On 23 September 2014 21:27, Denys Dmytriyenko <denis@denix.org> wrote:
> > Just to confirm - this patch was purposefully skipped in this merge cycle,
> > right?
> 
> Yes.  Pending a good rationale for why to break the freeze for u-boot
> it will wait for 1.8.

It was requested by Saul at the very end of July. But, unfortunately, as I 
mentioned in the other thread, August was rather hectic for me and I slipped 
the delivery - by the time I got back to it, it was already second week of 
September. Completely my fault, sorry.

If it has to wait until 1.8 window opens, I'll overlay it locally and will try 
to update to 2014.10 as soon as it gets released...


> (poky-contrib:ross/unfreeze is where i'm staging patches that look
> good for the 1.8 cycle)

-- 
Denys

