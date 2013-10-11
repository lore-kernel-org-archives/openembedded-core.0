Return-Path: <denis@denix.org>
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by mail.openembedded.org (Postfix) with ESMTP id 48B206CDC8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 19:42:31 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MUI005EWS2FGKY2@vms173003.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Fri, 11 Oct 2013 14:42:15 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EB7B220101; Fri,
	11 Oct 2013 15:42:14 -0400 (EDT)
Date: Fri, 11 Oct 2013 15:42:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-id: <20131011194214.GA27046@denix.org>
References: <1380045500-10798-1-git-send-email-fcooper@ti.com>
	<20131004184116.GA8393@denix.org> <1398912.rgWHutAkox@helios>
	<25585713.fM0EC1xtYq@helios>
MIME-version: 1.0
In-reply-to: <25585713.fM0EC1xtYq@helios>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Darren Hart <dvhart@linux.intel.com>,
	"Franklin S. Cooper Jr" <fcooper@ti.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [for dylan][PATCH] kernel.bbclass: Correct post(inst|rm) package association
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
X-List-Received-Date: Fri, 11 Oct 2013 19:42:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 11, 2013 at 10:33:03AM +0100, Paul Eggleton wrote:
> On Friday 04 October 2013 23:56:18 Paul Eggleton wrote:
> > On Friday 04 October 2013 14:41:16 Denys Dmytriyenko wrote:
> > > Ping. Is Dylan still alive?
> > 
> > It is yes. I pushed a paule/dylan-next poky-contrib branch the other day
> > including this fix but haven't had a chance to run it through the
> > autobuilder yet (been busy with 1.5 work). Will try to get it done next
> > week.
> 
> FYI the patch has now been merged to the dylan branch along with a few other 
> fixes.

Thanks, Paul!

-- 
Denys

