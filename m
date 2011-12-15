Received: from sirius.lasnet.de ([78.47.116.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <stefan@datenfreihafen.org>) id 1Rb9NA-0002i8-LV
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Dec 2011 12:21:12 +0100
Received: from [2001:638:602:1183:f2de:f1ff:fe62:28f7]
	(helo=novatech.datenfreihafen.org) by sirius.lasnet.de with esmtpsa 
	(Cipher TLS1.0:RSA_AES_256_CBC_SHA1:32) (Exim 4.69 #1)
	id 1Rb9GN-0007Sk-Ru by authid <stefan@sostec.de> with srv_auth_cram_md5;
	Thu, 15 Dec 2011 12:14:17 +0100
Received: from stefan by novatech.datenfreihafen.org with local (Exim 4.77)
	(envelope-from <stefan@novatech.datenfreihafen.org>)
	id 1Rb9H7-0005Wz-0e; Thu, 15 Dec 2011 12:14:57 +0100
Date: Thu, 15 Dec 2011 12:14:56 +0100
From: Stefan Schmidt <stefan@datenfreihafen.org>
To: Stefan Schmidt <stefan@datenfreihafen.org>
Message-ID: <20111215111456.GD23656@novatech.datenfreihafen.org>
References: <1323946873-28584-1-git-send-email-stefan@datenfreihafen.org>
MIME-Version: 1.0
In-Reply-To: <1323946873-28584-1-git-send-email-stefan@datenfreihafen.org>
X-Mailer: Mutt http://www.mutt.org/
X-KeyID: 0xDDF51665
X-Website: http://www.datenfreihafen.org/
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on sirius.lasnet.de
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,NO_RELAYS
	autolearn=ham version=3.2.5
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Thu, 15 Dec 2011 11:21:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello.

As JaMa pointed out it missing a layer prefix. Sorry for that.

The layer does not contain a README where to send patches so I figured
sending it to Adrian and cc'ing oe-core would make sense.

regards
Stefan Schmidt


