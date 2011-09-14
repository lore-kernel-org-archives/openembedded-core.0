Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1R3lYm-0002wv-VU
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 11:15:14 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1R3lTp-0004Zq-26
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 11:10:05 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 14 Sep 2011 10:10:04 +0100
In-Reply-To: <CAP9ODKrSgJqnrAmdDiaPtXYGRL-_8JQ7OUZcx92_hJFA-nCjng@mail.gmail.com>
References: <1314804932.19905.169.camel@phil-desktop>
	<4E6A82F8.5020508@linux.intel.com> <1315643085.1986.24.camel@ted>
	<1315646891.4368.13.camel@lenovo.internal.reciva.com>
	<1315648440.1986.27.camel@ted>
	<1315655628.4368.14.camel@lenovo.internal.reciva.com>
	<1315933706.13526.11.camel@ted>
	<1315934738.2519.126.camel@phil-desktop>
	<CAP9ODKrSgJqnrAmdDiaPtXYGRL-_8JQ7OUZcx92_hJFA-nCjng@mail.gmail.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1315991405.2519.129.camel@phil-desktop>
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
X-List-Received-Date: Wed, 14 Sep 2011 09:15:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-09-13 at 15:33 -0300, Otavio Salvador wrote:
> On Tue, Sep 13, 2011 at 14:25, Phil Blundell <philb@gnu.org> wrote:
> > Do you know how long it's likely to be before this release is complete
> > and the tree is re-opened for development?  I'm a bit unclear what the
> > process is for that.
> 
> Maybe we ought to use a 'next' branch for it?

If master is going to be closed for a long time (weeks/months) then yes,
that seems like a good idea.  If we're only talking about a few days
then it's probably not worth the effort.

p.




