Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RIozK-0005Pj-Iu
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 23:56:50 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.3])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RIota-0002Jm-Gf
	for openembedded-core@lists.openembedded.org;
	Tue, 25 Oct 2011 23:50:54 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <20111025072658.GF3602@jama.jama.net>
References: <cover.1319184832.git.Martin.Jansa@gmail.com>
	<bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
	<9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
	<CAMKF1soRAhf065VCJqZsQMUct1a0Ob5S2rJzN9QpE0A0R0SZ6g@mail.gmail.com>
	<20111021161620.GS3522@jama.jama.net>
	<1319286826.3310.1.camel@lenovo.internal.reciva.com>
	<20111025072658.GF3602@jama.jama.net>
Date: Tue, 25 Oct 2011 22:50:48 +0100
Message-ID: <1319579448.16582.10.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.3 
Subject: Re: [PATCH 3/8] pulseaudio-0.9.23: force ARM mode
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
X-List-Received-Date: Tue, 25 Oct 2011 21:56:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-10-25 at 09:26 +0200, Martin Jansa wrote:
> That's why I've called it work around in cover, because I think that fixing it in
> old 0.9.23 is not worth it, we can try to fix it in 1.1 when we have it.

Fair enough, though as a general rule I don't think the cover letter is
the right place for this sort of information.  Each patch that you send
ought really to be able to stand on its own merits and whatever
explanation is necessary ought to be in its own checkin message. 

In particular, the cover letter does not form part of the permanent
record in the git history, and it is liable to get lost if your patch is
incorporated into any kind of consolidated pull. 

p.




