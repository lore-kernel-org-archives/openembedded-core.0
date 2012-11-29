Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Te4Ny-0000L9-8F
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 14:42:38 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id EF093F811FE; Thu, 29 Nov 2012 06:28:23 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id E7DD2F811FD;
	Thu, 29 Nov 2012 06:28:22 -0700 (MST)
Message-ID: <50B76322.6000101@mlbassoc.com>
Date: Thu, 29 Nov 2012 06:29:06 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Where's my X cursor?
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
X-List-Received-Date: Thu, 29 Nov 2012 13:42:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I'm having troubles with the latest Xorg server.  I have a system
which has a small display (320x240) with a touch screen.  When I
bring up X, there is no mouse pointer, even if my touch screen is
disabled [in the kernel] and I have a "normal" (USB) mouse attached.

I have a second system which is very similar, but it has a larger
display (800x600) and everything works as expected.

Any ideas?

Note: I know in times past, X could have a larger virtual display
than the physical one and you could pan around.  Is this still
possible?  How?

Thanks

n.b. this is all preliminary to finding another problem; my touch
screen works fine using SDL and QT, but not X.  If I could just
see the mouse pointer, maybe I could get a clue why.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


