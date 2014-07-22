Return-Path: <ben.shelton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 94D8570671
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:30:32 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	s6MFUJNd025059; Tue, 22 Jul 2014 10:30:20 -0500
Received: from localhost ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2014072210301992-87427 ;
	Tue, 22 Jul 2014 10:30:19 -0500 
Date: Tue, 22 Jul 2014 10:30:12 -0500
From: Ben Shelton <ben.shelton@ni.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20140722153012.GA30289@bshelton-desktop>
References: <20140721182515.CD7355015A@opal.openembedded.org>
	<20140722091803.GO22875@jama>
MIME-Version: 1.0
In-Reply-To: <20140722091803.GO22875@jama>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/22/2014 10:30:19 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 07/22/2014 10:30:20 AM,
	Serialize complete at 07/22/2014 10:30:20 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.12.52, 1.0.14,
	0.0.0000
	definitions=2014-07-22_06:2014-07-22, 2014-07-22,
	1970-01-01 signatures=0
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Richard Tollerton : bootlogd: ensure /var/log/boot is created in volatiles
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
X-List-Received-Date: Tue, 22 Jul 2014 15:30:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 07/22, Martin Jansa wrote:
> On Mon, Jul 21, 2014 at 06:25:15PM +0000, git@git.openembedded.org wrote:
> > Module: openembedded-core.git
> > Branch: master-next
> > Commit: 6f963d761fa2916711b0d7808351515383bd5298
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=6f963d761fa2916711b0d7808351515383bd5298
> > 
> > Author: Richard Tollerton <rich.tollerton@ni.com>
> > Date:   Mon Jul 21 10:50:56 2014 -0500
> > 
> > bootlogd: ensure /var/log/boot is created in volatiles
> 
> subject usually starts with recipe/bbclass name, so it should be
> sysvinit not bootlogd.
> 
> 
> Please don't mix tabs and spaces for indentation, only spaces should be used
> in multi-line variables.
> 

Sorry about that -- do we need to resubmit the patch, or has it already
been merged?

Thanks,
Ben

> 
> -- 
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



