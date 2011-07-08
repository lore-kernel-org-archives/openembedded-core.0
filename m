Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfDq0-0003CB-IB for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:23:32 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GJfmH021657
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:19:41 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21561-01 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 17:19:37 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GJYwP021651
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:19:34 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAP9ODKpg3jMB=PbSgmPqSsuJTz78k5wBVHOwb0-7Yc4SgfrY6w@mail.gmail.com>
References: <cover.1310132765.git.otavio@ossystems.com.br>
	<b81093b9840677dd5c63bbed58ebfe2150791504.1310132765.git.otavio@ossystems.com.br>
	<1310138840.20015.881.camel@rex>
	<CAP9ODKpg3jMB=PbSgmPqSsuJTz78k5wBVHOwb0-7Yc4SgfrY6w@mail.gmail.com>
Date: Fri, 08 Jul 2011 17:18:54 +0100
Message-ID: <1310141934.20015.900.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/8] libarchive: add 2.8.4 version
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
X-List-Received-Date: Fri, 08 Jul 2011 16:23:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 12:50 -0300, Otavio Salvador wrote:
> On Fri, Jul 8, 2011 at 12:27, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2011-07-08 at 13:47 +0000, Otavio Salvador wrote:
> >> This recipe has been imported from OpenEmbedded (rev
> >> 6db4b9050e0e8b963e2a6b63790e48e3042ea99e).
> >
> > The piece of data I don't have here is the reason we need this OE-Core?
> 
> cmake uses it.

How did we get away without that for cmake-native? :/

Cheers,

Richard




