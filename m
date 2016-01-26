Return-Path: <denis@denix.org>
X-Greylist: delayed 3613 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 26 Jan 2016 15:20:52 UTC
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by mail.openembedded.org (Postfix) with ESMTP id 1D985605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jan 2016 15:20:52 +0000 (UTC)
Received: from gandalf.denix.org ([100.15.86.14]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPSA id <0O1K0031YD5ZYZC0@vms173021.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Tue, 26 Jan 2016 08:20:24 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=xDJgBcBrK5EN9DJ6g74wNQ==:117
	a=kj9zAlcOel0A:10 a=7aQ_Q-yQQ-AA:10	a=0gcC27t9AAAA:8
	a=O_wQDwkhlrEEz7ZSJ-cA:9 a=CjuIK1q_8ugA:10	a=-npClAyozakA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id A32D3161E1C; Tue,
	26 Jan 2016 09:20:23 -0500 (EST)
Date: Tue, 26 Jan 2016 09:20:23 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-id: <20160126142023.GE1652@denix.org>
References: <1453779264-8652-1-git-send-email-denis@denix.org>
	<CAJTo0LbSM2W2ZW_T69tSBWVR3Kg_TQXu7W6TqoG6=DivrU4C4A@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAJTo0LbSM2W2ZW_T69tSBWVR3Kg_TQXu7W6TqoG6=DivrU4C4A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] stress-ng: add 0.05.09
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
X-List-Received-Date: Tue, 26 Jan 2016 15:20:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jan 26, 2016 at 11:24:43AM +0000, Burton, Ross wrote:
> On 26 January 2016 at 03:34, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > A clean room re-implementation and extension of the original stress tool.
> >
> 
> What's the rationale for adding this to oe-core over another layer?

None, besides the original stress is in oe-core. What other layer would you 
suggest?

-- 
Denys

