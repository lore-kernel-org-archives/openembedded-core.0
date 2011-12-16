Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1RbcOb-00082N-SN
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 19:20:37 +0100
Received: from [2001:638:602:1183:f2de:f1ff:fe62:28f7]
	(helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1RbcHr-00024l-21 by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Fri, 16 Dec 2011 19:13:40 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1RbcIb-0006PC-9H; Fri, 16 Dec 2011 19:14:25 +0100
Date: Fri, 16 Dec 2011 19:14:25 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20111216181425.GE11682@novatech.datenfreihafen.org>
References: <1323946873-28584-1-git-send-email-stefan@datenfreihafen.org>
	<4EEB8669.30900@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4EEB8669.30900@linux.intel.com>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-xilinx: Update inc file path after oe-core change
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
X-List-Received-Date: Fri, 16 Dec 2011 18:20:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

On Fri, 2011-12-16 at 09:56, Saul Wold wrote:
> On 12/15/2011 03:01 AM, Stefan Schmidt wrote:
> >Signed-off-by: Stefan Schmidt<stefan@datenfreihafen.org>
> >---
> >  recipes-bsp/uboot/u-boot-xilinx_git.bb |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> Does this directory need to be renamed also?

Good point. Also a patch is named uboot instead of u-boot. All changed
in a new patch just send to the ml.

regards
Stefan Schmidt


