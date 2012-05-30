Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZmR5-00004u-49 for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 19:11:51 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UH1XXA023648
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 18:01:33 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23393-03 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 18:01:29 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UH1NEC023641
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 18:01:24 +0100
Message-ID: <1338397283.20169.166.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 18:01:23 +0100
In-Reply-To: <4FC642FB.2040305@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
	<4FC642FB.2040305@intel.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 00/32] denzil pull request
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
X-List-Received-Date: Wed, 30 May 2012 17:11:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-05-30 at 08:55 -0700, Scott Garman wrote:
> On 05/24/2012 02:38 PM, Scott Garman wrote:
> > Hello,
> >
> > This is the first pull request for the oe-core denzil branch, based on
> > a set of commits I've been testing from my sgarman/denzil-next branch.
> >
> > These commits have passed an array of build and runtime tests,
> > including the following nightly build:
> >
> > http://autobuilder.yoctoproject.org:8010/builders/nightly/builds/462
> >
> > a non-gplv3 build:
> >
> > http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/70
> >
> > and a tiny build:
> >
> > http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/47
> >
> > Please give this pull request a few days to receive feedback and ACKs
> > from the community.
> 
> So far just one Ack from Koen. In the absence of any Nacks I'll be 
> asking Richard to merge this tomorrow.

We overlapped. I mentioned in the meeting yesterday I'd take this
yesterday/today and just merged it! :)

Cheers,

Richard



