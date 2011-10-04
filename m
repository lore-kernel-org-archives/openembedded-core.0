Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RB1cV-00074w-WB
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 11:49:04 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RB1X3-0000rT-OQ
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Oct 2011 11:43:25 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 04 Oct 2011 10:43:25 +0100
In-Reply-To: <20111004072817.GB19366@jama.jama.net>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
	<7a380e5d1538c175e164b2d249d182c723fcda15.1317648040.git.Martin.Jansa@gmail.com>
	<1317657635.13337.10.camel@phil-desktop>
	<20111004072817.GB19366@jama.jama.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1317721405.13337.18.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCHv2 04/30] xf86-video-omapfb: bump SRCREV and add patch from meta-oe
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
X-List-Received-Date: Tue, 04 Oct 2011 09:49:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-04 at 09:28 +0200, Martin Jansa wrote:
> On Mon, Oct 03, 2011 at 05:00:35PM +0100, Phil Blundell wrote:
> > And, finally, if this is an OMAP-specific driver, why is it in oe-core
> > in the first place?  I would have thought it would be better placed in
> > meta-ti or some such layer.
> 
> We've discussed it on oe-devel ML already
> http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-September/034781.html

Is it testable in oe-core?  If not then I don't think it belongs there.

p.




