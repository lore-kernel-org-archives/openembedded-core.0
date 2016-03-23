Return-Path: <uol@pengutronix.de>
Received: from metis.ext.4.pengutronix.de (metis.ext.4.pengutronix.de
	[92.198.50.35])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDD86014F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 13:38:06 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0]
	ident=Debian-exim) by metis.ext.pengutronix.de with esmtps
	(TLS1.2:RSA_AES_128_CBC_SHA1:128) (Exim 4.80)
	(envelope-from <uol@pengutronix.de>)
	id 1aiiz8-0000c3-TK; Wed, 23 Mar 2016 14:38:06 +0100
Received: from uol by ptx.hi.pengutronix.de with local (Exim 4.84_2)
	(envelope-from <uol@pengutronix.de>)
	id 1aiiz8-00062E-D5; Wed, 23 Mar 2016 14:38:06 +0100
Date: Wed, 23 Mar 2016 14:38:06 +0100
From: Ulrich =?iso-8859-1?Q?=D6lmann?= <u.oelmann@pengutronix.de>
To: Dan McGregor <danismostlikely@gmail.com>
Message-ID: <20160323133806.GX28020@pengutronix.de>
References: <CACS+7ZTw_vCMo5dfGCT9PyUMFvq7QaoXRbK5Ou60Y=m=YGhL_g@mail.gmail.com>
	<1458722860-17353-1-git-send-email-u.oelmann@pengutronix.de>
	<CACS+7ZRFa0j2tWsW2EyLhtHbBStsb8StE8EEt=LDGQ3eqP-_8g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACS+7ZRFa0j2tWsW2EyLhtHbBStsb8StE8EEt=LDGQ3eqP-_8g@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:34:46 up 15 days, 16:34, 41 users,  load average: 0.00, 0.02, 0.05
User-Agent: Mutt/1.5.23 (2014-03-12)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: uol@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nfs-utils: bugfix: adjust name of statd service unit
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
X-List-Received-Date: Wed, 23 Mar 2016 13:38:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 23, 2016 at 07:18:38AM -0600, Dan McGregor wrote:
> Oh, I did backport it locally, I was just hoping to get it into the
> upstream jethro branch.

Let's see what upstream decides.

> Cherry picking your commit was pretty straightforward.

:)

Regards
Ulrich

-- 
Pengutronix e.K.                           |                             |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

