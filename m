Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id B63D460248
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Mar 2016 23:32:39 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.84)
	(envelope-from <pb@pbcl.net>)
	id 1akgeF-0004L0-35; Tue, 29 Mar 2016 01:32:39 +0200
Message-ID: <1459207953.2322.31.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Tom Hochstein <tom.hochstein@freescale.com>
Date: Tue, 29 Mar 2016 00:32:33 +0100
In-Reply-To: <1459206002-30154-3-git-send-email-tom.hochstein@freescale.com>
References: <1459206002-30154-1-git-send-email-tom.hochstein@freescale.com>
	<1459206002-30154-3-git-send-email-tom.hochstein@freescale.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v4 3/5] weston: Add XWayland support
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
X-List-Received-Date: Mon, 28 Mar 2016 23:32:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-03-28 at 18:00 -0500, Tom Hochstein wrote:
> Add a new distro feature 'xwayland' to enable XWayland support.

Why does this need to be a DISTRO_FEATURE?

p.



