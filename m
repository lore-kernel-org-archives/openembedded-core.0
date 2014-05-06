Return-Path: <denis@denix.org>
X-Greylist: delayed 3600 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 06 May 2014 21:59:41 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3C9086017E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 21:59:41 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N5600JP67MYCE80@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 06 May 2014 15:59:22 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7E5F1201BF; Tue,
	06 May 2014 16:59:22 -0400 (EDT)
Date: Tue, 06 May 2014 16:59:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-id: <20140506205922.GF11339@denix.org>
References: <536899F5.1030104@gmail.com> <20140506205518.GE11339@denix.org>
	<CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1spaD8x1e2VYMwq34R2RLbz6xDw9ypDVwzr8sQJBuOpm5A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: meta-toolchain doesn't compile working binaries
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
X-List-Received-Date: Tue, 06 May 2014 21:59:42 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, May 06, 2014 at 01:56:57PM -0700, Khem Raj wrote:
> On Tue, May 6, 2014 at 1:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > Do you know that OE toolchain is not relocatable?
> 
> is that true ?

Is not auto-relocatable - is it better?

-- 
Denys

