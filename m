Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1QoHA1-0005TZ-Bl
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 17:45:37 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1QoH5o-0002V6-Vw; Tue, 02 Aug 2011 17:41:17 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 02 Aug 2011 16:41:16 +0100
In-Reply-To: <A8C5CE71-29E0-4C18-9D66-7CE0EFAE4782@kernel.crashing.org>
References: <3C9A62B9-7C88-4DF0-A379-8E58955B89CD@kernel.crashing.org>
	<A8C5CE71-29E0-4C18-9D66-7CE0EFAE4782@kernel.crashing.org>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1312299676.4325.54.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: help with gcc-configure-common bug
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
X-List-Received-Date: Tue, 02 Aug 2011 15:45:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-08-02 at 10:36 -0500, Kumar Gala wrote:
> Would really love if anyone knows what is suppose to be going on with SYSTEMLIBS_DIR to chime in here.

That stuff was all added in 934d3853 as part of the source tree sharing
work.  So I guess you should take it up with Robert Yang.

p.




