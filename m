Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1Qm64h-0003b2-OU
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:31:07 +0200
Received: from cambridge.roku.com ([81.142.160.137] helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1Qm60d-0002BH-Gd
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 17:26:55 +0200
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 27 Jul 2011 16:26:54 +0100
In-Reply-To: <1311780091-10692-1-git-send-email-koen@dominion.thruhere.net>
References: <1311780091-10692-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1311780415.30326.377.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] libpam 1.1.4: fix packaging
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
X-List-Received-Date: Wed, 27 Jul 2011 15:31:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-07-27 at 17:21 +0200, Koen Kooi wrote:
> | ERROR: QA Issue: non debug package contains .debug directory: libpam-xtests path /work/armv7a-angstrom-linux-gnueabi/libpam-1.1.4-r0/packages-split/libpam-xtests/usr/share/Linux-PAM/xtests/.debug/tst-pam_dispatch4

That reminds me, what became of the plan to enable QA errors by default?

p.




