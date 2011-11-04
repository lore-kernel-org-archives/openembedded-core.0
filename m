Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RMRIV-0007ZI-RW
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 22:27:35 +0100
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RMRCZ-0004m7-Va
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 22:21:28 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <7e3c2e21652019ed5dd2d45beff62a855152f0a4.1320430778.git.otavio@ossystems.com.br>
References: <cover.1320430778.git.otavio@ossystems.com.br>
	<7e3c2e21652019ed5dd2d45beff62a855152f0a4.1320430778.git.otavio@ossystems.com.br>
Date: Fri, 04 Nov 2011 21:17:12 +0000
Message-ID: <1320441432.3137.2.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 4/5] dhcp: rename dhcp4.inc to dhcp.inc
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
X-List-Received-Date: Fri, 04 Nov 2011 21:27:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-11-04 at 18:20 +0000, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  .../dhcp/{dhcp4.inc => dhcp.inc}                   |    0
>  meta/recipes-connectivity/dhcp/dhcp_4.2.0.bb       |    2 +-
>  2 files changed, 1 insertions(+), 1 deletions(-)
>  rename meta/recipes-connectivity/dhcp/{dhcp4.inc => dhcp.inc} (100%)

Why is this patch an improvement?  I don't have anything against it
particularly but it doesn't seem that it buys much either, and there is
no clue in the commit message as to what it is trying to achieve.

p.




