Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QLwte-0005RG-Aa for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 14:27:38 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GCOkoY019314
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 13:24:46 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 18999-07 for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 13:24:42 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4GCOdLB019308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 13:24:40 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=_=Ei4+Gn3HAi=pZrQaXYH_5MwnA@mail.gmail.com>
References: <cover.1305035617.git.richard.purdie@linuxfoundation.org>
	<1305120614.30391.349.camel@rex>
	<BANLkTi=_=Ei4+Gn3HAi=pZrQaXYH_5MwnA@mail.gmail.com>
Date: Mon, 16 May 2011 13:24:38 +0100
Message-ID: <1305548678.3424.55.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 0/6] RFC Distro config changes
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
X-List-Received-Date: Mon, 16 May 2011 12:27:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2011-05-15 at 17:27 -0300, Otavio Salvador wrote:
> On Wed, May 11, 2011 at 10:30, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I've taken feedback on board, tweaked the series and then merged it. My
> > reasoning is that whilst this might not be 100% perfect in every way, it
> > moves us a lot closer to where we want to be. We were going to start
> > seeing patch conflicts if it was out of tree for too long and that
> > didn't seem worthwhile.
> 
> I have expected at least another review cycle since this is a huge
> change and potential to change a lot of stuff for users...

Its a process of iterative improvement. I'm not calling what is there
now 100% complete, just a lot better than what preceded it. If there are
further changes needed, lets discuss them! :)

Cheers,

Richard




