Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Td0P8-0008UT-8G
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Nov 2012 16:15:26 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1Td0BQ-0000Su-It; Mon, 26 Nov 2012 16:01:16 +0100
From: Phil Blundell <philb@gnu.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 26 Nov 2012 15:01:15 +0000
In-Reply-To: <20121126135758.GB3401@jama.jama.net>
References: <1348318001-18232-1-git-send-email-Martin.Jansa@gmail.com>
	<1353933452-13251-1-git-send-email-Martin.Jansa@gmail.com>
	<CADkTA4N2mbhBgh4o3W9mwa3Jg7ohZEB13FsEGoOLQZ04t1fAcQ@mail.gmail.com>
	<20121126135758.GB3401@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1353942076.13864.742.camel@phil-desktop>
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: use the same versioning schema for modules.tgz and provide link to latest
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Nov 2012 15:15:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-11-26 at 14:57 +0100, Martin Jansa wrote:
> I remember seeing some thread about making whole modules tarball
> creation optional and disabled by default, so I guess there is only a
> few users of this.

That particular patch was apparently rejected, but I think you're right
that only one or two people said at the time that they were using the
tarball.  It does seem to be a slightly fringe interest.

p.




