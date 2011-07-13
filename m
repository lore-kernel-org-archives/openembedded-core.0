Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qh0cf-00007p-Ga
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 16:41:09 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qh0Yr-0004eD-Dd
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 16:37:13 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jul 2011 15:37:12 +0100
In-Reply-To: <CAOd_LFwkz6w5oOmwbQwikW6bptwtWiwXGXwmPLDEHga0SAjCdQ@mail.gmail.com>
References: <CAPhnLPCXP0mPU6=WxG8n-zLJJOozwyqZo9pMqkrmO4gdOJrDOg@mail.gmail.com>
	<CAOd_LFwkz6w5oOmwbQwikW6bptwtWiwXGXwmPLDEHga0SAjCdQ@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1310567833.2378.12.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 0/1] Additional license wrangling functionality
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Jul 2011 14:41:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-13 at 10:06 -0400, Cliff Brake wrote:
> Why is the License field no longer included in the control file?

Looks like it was only added to OE.dev relatively recently (in 2008)
which was after oe-core was forked.  The commit in question from oe.dev
seems to be e35d1ffad1553f259b084578992f15d10f590f98 and I expect it
would apply to oe-core without too much trouble.

p.




