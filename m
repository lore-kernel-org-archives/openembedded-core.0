Received: from host46-141-dynamic.2-87-r.retail.telecomitalia.it
	([87.2.141.46] helo=router.workgroup)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gnutoo@no-log.org>)
	id 1TaS52-0002wK-Jn; Mon, 19 Nov 2012 15:12:08 +0100
Received: from [192.168.1.121] (helo=gnutoo-desktop)
	by router.workgroup with esmtpsa (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.76) (envelope-from <gnutoo@no-log.org>)
	id 1TaRqV-0002ri-S8; Mon, 19 Nov 2012 14:57:07 +0100
Date: Mon, 19 Nov 2012 14:57:28 +0100
From: Denis 'GNUtoo' Carikli <gnutoo@no-log.org>
To: Stefan Schmidt <stefan@datenfreihafen.org>
Message-ID: <20121119145728.32c62e6c@gnutoo-desktop>
In-Reply-To: <20121112182616.GB22235@novatech.datenfreihafen.org>
References: <12301427.Yf0uchSh3U@helios>
	<20121112182616.GB22235@novatech.datenfreihafen.org>
X-Mailer: Claws Mail 3.7.9 (GTK+ 2.24.6; i686-pc-linux-gnu)
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: OE-Classic recipe migration status
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
X-List-Received-Date: Mon, 19 Nov 2012 14:12:08 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Nov 2012 18:26:16 +0000
Stefan Schmidt <stefan@datenfreihafen.org> wrote:
> I now longer work for BugLabs but  during my last months there I split
> up our bunch of recipes according to what we think was sane at that
> time. Think end of last year here.
> 
> The BSP layer can be found here:
> https://github.com/buglabs/meta-bug
However (since my last pull request) it fails to boot and blocks in
systemd with an angstrom image, I'll get the diff and a log soon.
> And BugLabs specific recipes here:
> https://github.com/buglabs/meta-buglabs
Nice, I didn't know about it.

PS: Note that I don't work for Buglabs either, I just happen to have
some buglabs(bug 2.0, bug 1.3 wifi, bug 1.3 + many modules) devices.

Denis.


