Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Ue01G-00047M-9y for openembedded-core@lists.openembedded.org;
	Sun, 19 May 2013 11:35:12 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.5])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1Udzja-000524-3E; Sun, 19 May 2013 11:16:54 +0200
Message-ID: <1368955006.16396.41.camel@pb-ThinkPad-R50e>
From: Phil Blundell <pb@pbcl.net>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 19 May 2013 10:16:46 +0100
In-Reply-To: <20130519085835.GE3196@jama>
References: <1368356739-17625-1-git-send-email-sgw@linux.intel.com>
	<20130519082432.GD3196@jama>
	<1368953701.16396.37.camel@pb-ThinkPad-R50e>
	<20130519085835.GE3196@jama>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC] tcmode-default: Set 4.8 as default
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
X-List-Received-Date: Sun, 19 May 2013 09:35:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2013-05-19 at 10:58 +0200, Martin Jansa wrote:
> On Sun, May 19, 2013 at 09:55:01AM +0100, Phil Blundell wrote:
> > On Sun, 2013-05-19 at 10:24 +0200, Martin Jansa wrote:
> > > Please submit a full bug report,
> > > with preprocessed source if appropriate.
> > > See <http://gcc.gnu.org/bugs.html> for instructions.
> > 
> > Did you do that?  Please add the PR number to the check message so we
> > can tell when it's been fixed.
> 
> Not yet, I'm trying to strip test case from pixman, but sofar I can
> reproduce it only with significant chunk of pixman code.

That doesn't matter.  Unless the testcase is hundreds of megabytes, you
don't need to make heroic efforts to reduce it.  Just go ahead and file
a bug using whatever file you found the problem in.

p.




