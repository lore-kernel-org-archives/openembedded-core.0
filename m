Received: from familie-heinold.de
	([85.214.48.103] helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1QPHTy-0007fT-FT
	for openembedded-core@lists.openembedded.org;
	Wed, 25 May 2011 19:02:54 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 23363110022F;
	Wed, 25 May 2011 18:50:08 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id ADAEA1100226;
	Wed, 25 May 2011 18:50:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_05 autolearn=ham
	version=3.3.1
Received: from rhein.familie-heinold.de (f052234063.adsl.alicedsl.de
	[78.52.234.63]) by mail.familie-heinold.de (Postfix) with ESMTPA;
	Wed, 25 May 2011 18:50:07 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id 9C5A03C0DE; Wed, 25 May 2011 18:49:20 +0200 (CEST)
Date: Wed, 25 May 2011 18:49:20 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110525164919.GB11519@mail.familie-heinold.de>
References: <4DDBDE9D.5000709@linux.intel.com> <1306338695.27470.41.camel@rex>
	<BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <BANLkTim8VzrP7Zd4yDRaa75X0gXUL7wC=g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Updating u-boot for oe-core or meta-yocto
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
X-List-Received-Date: Wed, 25 May 2011 17:02:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I agree with khem, each machine should maintain it's bootloader in his bsp
or layer.

Bye Henning


