Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1TIRIr-0001Ej-Fh
	for openembedded-core@lists.openembedded.org;
	Sun, 30 Sep 2012 23:43:57 +0200
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.6])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>)
	id 1TIR6N-0004Pk-Ek; Sun, 30 Sep 2012 23:31:03 +0200
Message-ID: <1349040515.4422.64.camel@x121e.pbcl.net>
From: Phil Blundell <philb@gnu.org>
To: Ross Burton <ross.burton@intel.com>
Date: Sun, 30 Sep 2012 22:28:35 +0100
In-Reply-To: <430F096FEBAC48CB95BE1DE3D0F1A5CC@intel.com>
References: <1349027303.4422.63.camel@x121e.pbcl.net>
	<430F096FEBAC48CB95BE1DE3D0F1A5CC@intel.com>
X-Mailer: Evolution 3.4.3-1 
Mime-Version: 1.0
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] pango: don't try to split modules if none were installed
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
X-List-Received-Date: Sun, 30 Sep 2012 21:43:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2012-09-30 at 19:31 +0100, Ross Burton wrote:
> As this keeps on cropping up, I did have a patch to do_split_packages
> that added an allow-empty argument. Might be worth digging out. 

Sounds like a decent plan.

p.





