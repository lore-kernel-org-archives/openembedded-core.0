Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id E21726B1EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 16:17:22 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6TGQxJb017283; Mon, 29 Jul 2013 17:26:59 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id qmH5F_eh2MsD; Mon, 29 Jul 2013 17:26:59 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r6TGQseA017275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 29 Jul 2013 17:26:55 +0100
Message-ID: <1375114624.5851.5.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 29 Jul 2013 17:17:04 +0100
In-Reply-To: <6339709.CFmXEXRQnE@helios>
References: <cover.1375110365.git.sgw@linux.intel.com>
	<6339709.CFmXEXRQnE@helios>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL (Part 2) (resend) 00/26] Branch Updated with Correct Set
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 29 Jul 2013 16:17:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-07-29 at 16:49 +0100, Paul Eggleton wrote:
> On Monday 29 July 2013 08:07:51 Saul Wold wrote:
> > Branch is updated, sorry not sure what happened with the
> > obex and texinfo, I thought I had removed them since they did not
> > show up in the summary below (in the first email).
> > 
> > Already basicly ACK'ed by Ross and Paul
> > 
> > Thanks
> > Sau!
> > 
> > The following changes since commit 09deeef20ee5a0c12ad4fd89cace6e0fb832d5b1:
> > 
> >   external-sourcery: add missing providers (2013-07-27 23:28:29 -0700)
> > 
> > are available in the git repository at:
> > 
> >   git://git.openembedded.org/openembedded-core-contrib sgw/stage2
> >  
> > http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/
> > stage2
> > 
> > Andrei Dinu (1):
> >   libpng : upgrade to 1.6.3
> > 
> > Emilia Ciobanu (14):
> >   babeltrace: fix recipe name
> >   build-appliance-image: fix recipe name add GIT revision to PV variable
> >   chkconfig-alternatives-native: fix recipe name and add GIT revision to
> >     PV variable
> >   connman-gnome: fix recipe name add GIT revision to PV variable
> >   docbook-sgml-dtd-3.1-native: fix recipe name
> >   docbook-sgml-dtd-4.1-native: fix recipe name
> >   hwlatdetect: fix recipe name and add GIT revision to PV variable
> >   lttng-ust: fix recipe name and add GIT revision to PV variable
> >   mtd-utils: fix recipe name and add GIT revision to PV variable
> >   neard: fix recipe name
> >   rt-tests: fix recipe name add GIT revision to PV variable
> >   update-rc.d: fix recipe name and add GIT revision to PV variable
> 
> Some of these patches were meant to be dropped... so no ack from me.

This really isn't filling me with confidence...

Cheers,

Richard


