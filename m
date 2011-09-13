Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R3Won-000325-BR
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 19:30:45 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R3Wjq-0003O1-6n
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Sep 2011 19:25:38 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 13 Sep 2011 18:25:37 +0100
In-Reply-To: <1315933706.13526.11.camel@ted>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com>  <1315643085.1986.24.camel@ted>
	<1315646891.4368.13.camel@lenovo.internal.reciva.com>
	<1315648440.1986.27.camel@ted>
	<1315655628.4368.14.camel@lenovo.internal.reciva.com>
	<1315933706.13526.11.camel@ted>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1315934738.2519.126.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] pango: use qemu to generate pango.modules during rootfs construction
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
X-List-Received-Date: Tue, 13 Sep 2011 17:30:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 18:08 +0100, Richard Purdie wrote:
> I've therefore taken the decision to revert this since I really want to
> stablise for the release at this point and I'm not filled with
> confidence that there aren't other problems lurking here.

Okay, fair enough.  Actually I thought Saul had already reverted it a
few days ago but maybe I misunderstood what he was saying.

Do you know how long it's likely to be before this release is complete
and the tree is re-opened for development?  I'm a bit unclear what the
process is for that.

p.




