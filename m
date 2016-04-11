Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by mail.openembedded.org (Postfix) with ESMTP id ADE976FFD4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 16:59:21 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5H00FHKB6XHQ40@vms173007.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 11 Apr 2016 11:59:21 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=kj9zAlcOel0A:10 a=kziv93cY1bsA:10	a=sozttTNsAAAA:8 a=4RBUngkUAAAA:8
	a=obsejYyUGo3rRHOU0tYA:9	a=CjuIK1q_8ugA:10 a=4eMpV3Q9VpoA:10
Received: by 100.15.86.14 with SMTP id 3e29d6b6; Mon, 11 Apr 2016 16:59:21 GMT
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 401BD161F8C; Mon,
	11 Apr 2016 12:59:21 -0400 (EDT)
Date: Mon, 11 Apr 2016 12:59:21 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Message-id: <20160411165921.GP16135@denix.org>
References: <1460091428-15870-1-git-send-email-denis@denix.org>
	<570BCD36.30204@ni.com>
MIME-version: 1.0
In-reply-to: <570BCD36.30204@ni.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] opkg-utils: re-do find/ls code to not fail on filenames with spaces
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
X-List-Received-Date: Mon, 11 Apr 2016 16:59:25 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Apr 11, 2016 at 11:13:42AM -0500, Alejandro del Castillo wrote:
> On 04/07/2016 11:57 PM, Denys Dmytriyenko wrote:
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> 
> do you mind posting the patch to the opkg-devel@googlegroups.com list too?

Sure, will do.

-- 
Denys

