Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 66B486A464
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 08:41:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2013 01:38:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,676,1367996400"; d="scan'208";a="371015075"
Received: from unknown (HELO helios.localnet) ([10.252.122.80])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2013 01:40:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Yi Qingliang <niqingliang2003@gmail.com>
Date: Tue, 16 Jul 2013 09:40:49 +0100
Message-ID: <5751388.cD6vFYynDJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1583654.sNKEILZnlI@yiqingliang-pc>
References: <1494076.GQbbvjWTEm@yiqingliang-pc> <3096832.OcaoZJbLJn@helios>
	<1583654.sNKEILZnlI@yiqingliang-pc>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt 4.8.5 package error
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
X-List-Received-Date: Tue, 16 Jul 2013 08:41:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 16 July 2013 13:24:34 Yi Qingliang wrote:
> On Monday, July 15, 2013 09:48:15 AM Paul Eggleton wrote:
> > On Monday 15 July 2013 09:12:23 Yi Qingliang wrote:
> > > hello,
> > > 
> > > 	I'm using latest poky, when packaging qte, got following error, any
> > > 	idea?
> > 
> > Please pull the latest changes, this has been switched back to a warning.
> 
> it was latest already, two days before.
> I just updated it , no new commit.
> maybe you can tell me which commit switched it back to warning?

Sure:

http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=cb6ce45e1f73f42ab24e5abf7e1efbb54b1b83f3

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

