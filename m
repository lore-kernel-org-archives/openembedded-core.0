Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SsvIc-0001JX-Sx for openembedded-core@lists.openembedded.org;
	Sun, 22 Jul 2012 14:30:15 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MCIniC027990
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 13:18:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 27737-01 for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 13:18:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6MCIgXS027984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jul 2012 13:18:43 +0100
Message-ID: <1342959527.21788.76.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jul 2012 13:18:47 +0100
In-Reply-To: <CAP9ODKq0_7mjdG-g6QMTeqjJcgrud6TeFcmkeGAwRr-cY1vhqA@mail.gmail.com>
References: <1342808031-21564-1-git-send-email-otavio@ossystems.com.br>
	<1342808031-21564-2-git-send-email-otavio@ossystems.com.br>
	<CAP9ODKq0_7mjdG-g6QMTeqjJcgrud6TeFcmkeGAwRr-cY1vhqA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/2] shadow: use 'users' group by default
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
X-List-Received-Date: Sun, 22 Jul 2012 12:30:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-07-20 at 15:16 -0300, Otavio Salvador wrote:
> On Fri, Jul 20, 2012 at 3:13 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> 
> This would be nice to have included in next denzil.

Reading the one line description of this, I have no idea what the
problem was or how this solves it. Its therefore unlikely to make it
into master, let alone denzil. Can you provide more detail please.

Cheers,

Richard




