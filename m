Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1QW2ux-000590-GD for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 10:54:43 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <pb@pbcl.net>) id 1QW2rh-0002DL-S1
	for openembedded-core@lists.openembedded.org;
	Mon, 13 Jun 2011 10:51:21 +0200
From: Phil Blundell <pb@pbcl.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <cover.1307937636.git.raj.khem@gmail.com>
References: <cover.1307937636.git.raj.khem@gmail.com>
Date: Mon, 13 Jun 2011 09:51:15 +0100
Message-ID: <1307955075.6879.11.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: Re: [PATCH 0/1] Upgrade gcc 4.6.0 to latest on FSF 4.6 branch
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
X-List-Received-Date: Mon, 13 Jun 2011 08:54:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-06-12 at 21:03 -0700, Khem Raj wrote:
> This patch brings in new patches from gcc 4.6 FSF branch
> And refreshes the headers of existing backported patches
> to not have git patch numbers in comments
> 
> I am not sending the patch itself to mailing list due to its
> large size so please review it on the contrib tree itself
> 

Would we not be better off just pulling the tip of the 4.6 branch from
FSF SVN, rather than having to keep all these patches in git?

p.




