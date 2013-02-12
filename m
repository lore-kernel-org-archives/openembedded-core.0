Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U5Jlf-0005fF-Rk for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 18:35:51 +0100
Received: from cpc14-cmbg17-2-0-cust423.5-4.cable.virginmedia.com
	([86.14.229.168] helo=[172.30.1.45])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <pb@pbcl.net>)
	id 1U5JWA-0004N0-6r; Tue, 12 Feb 2013 18:19:42 +0100
Message-ID: <1360689548.4246.39.camel@phil-desktop.brightsign>
From: Phil Blundell <pb@pbcl.net>
To: McClintock Matthew-B29882 <B29882@freescale.com>
Date: Tue, 12 Feb 2013 17:19:08 +0000
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A87213C@039-SN1MPN1-002.039d.mgd.msft.net>
References: <1360247634-10957-1-git-send-email-Martin.Jansa@gmail.com>
	<51142E1F.1020404@linux.intel.com>
	<70CC66F5C30A414DADDA6973E4CA391A87213C@039-SN1MPN1-002.039d.mgd.msft.net>
X-Mailer: Evolution 3.4.4-1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH] libpfm4: exclude from world
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
X-List-Received-Date: Tue, 12 Feb 2013 17:35:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-02-12 at 17:14 +0000, McClintock Matthew-B29882 wrote:
> We really need COMPATIBLE_ARCH here...

Why can't you use COMPATIBLE_HOST?

p.




