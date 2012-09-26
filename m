Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TGrFj-0000XO-Hf
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 15:02:11 +0200
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1TGqq2-0006Qf-6R
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 14:35:38 +0200
From: Phil Blundell <philb@gnu.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Sep 2012 13:35:37 +0100
In-Reply-To: <1348662505.31293.110.camel@phil-desktop>
References: <1348661842.31293.108.camel@phil-desktop>
	<20120926122041.GI3313@jama.jama.net>
	<1348662505.31293.110.camel@phil-desktop>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1348662938.31293.112.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH] glib-2.0: Update to 2.34.0
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
X-List-Received-Date: Wed, 26 Sep 2012 13:02:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-09-26 at 13:28 +0100, Phil Blundell wrote:
>  SRC_URI[md5sum] = "bf84fefd9c1a5b5a7a38736f4ddd674a"
>  SRC_URI[sha256sum] = "a5d742a4fda22fb6975a8c0cfcd2499dd1c809b8afd4ef709bda4d11b167fae2"

Hm, it does look slightly suspicious that this didn't change.  I guess
something must have gone wrong when I rebased the patch.  I'll sort that
out and send a new one.

p.



