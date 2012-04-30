Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1SOy18-0006wP-42
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 23:20:22 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1SOxrl-0007T8-8C
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 23:10:42 +0200
Message-ID: <1335820179.3133.172.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 30 Apr 2012 22:09:39 +0100
In-Reply-To: <4F9EFEA5.1080407@linux.intel.com>
References: <1334159995-3392-1-git-send-email-florin.sarbu@windriver.com>
	<4F9EFEA5.1080407@linux.intel.com>
X-Mailer: Evolution 3.2.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH] vala: Add vala package as a devtool (version 0.12.1)
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
X-List-Received-Date: Mon, 30 Apr 2012 21:20:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-04-30 at 14:05 -0700, Saul Wold wrote:
> Also, until we get serious about systemd in poky, I think this patch 
> will be on hold, it is something we are going to work on for 1.3.

I'm not quite sure I understand what poky has to do with it.  If this
patch is a poky-specific thing then presumably it should be in some poky
layer and not in oe-core at all.  Conversely, if it isn't a
poky-specific thing then it doesn't seem as though it should be
contingent on poky "getting serious" about anything.

p.




