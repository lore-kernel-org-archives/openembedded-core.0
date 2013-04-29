Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UWtAZ-0001Tq-Qg for openembedded-core@lists.openembedded.org;
	Mon, 29 Apr 2013 20:51:24 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1UWstL-0004qi-C6; Mon, 29 Apr 2013 20:33:35 +0200
Message-ID: <1367260399.25055.14.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Mon, 29 Apr 2013 19:33:19 +0100
In-Reply-To: <1367247290.5379.31.camel@ted>
References: <1366975838.14512.99.camel@phil-desktop.brightsign>
	<6907890.oTRpLvAECS@helios> <1367053734.29677.91.camel@ted>
	<2359996.YCG7Bud1Ca@helios> <1367247290.5379.31.camel@ted>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image.bbclass: Don't mark do_rootfs and do_build as nostamp
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
X-List-Received-Date: Mon, 29 Apr 2013 18:51:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-04-29 at 15:54 +0100, Richard Purdie wrote:
> On Mon, 2013-04-29 at 15:45 +0100, Paul Eggleton wrote:
> > Given that this is a departure from previously established behaviour, I do 
> > think we need to give a more of an explanation in the commit message than the 
> > proposed patch however; something that summarises Richard's explanation above 
> > would be informative.
> 
> Agreed, Phil's commit message missed out a few important points.

Do you want me to re-send it with a different commit message?

p.



