Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SZmIL-0007TL-T1 for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 19:02:50 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGqVq8023580
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:52:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 23393-02 for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:52:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4UGqPGV023574
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 May 2012 17:52:25 +0100
Message-ID: <1338396745.20169.164.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 30 May 2012 17:52:25 +0100
In-Reply-To: <4FBEAB97.6010209@intel.com>
References: <cover.1337892418.git.scott.a.garman@intel.com>
	<4FBEAB97.6010209@intel.com>
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
X-List-Received-Date: Wed, 30 May 2012 17:02:50 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-05-24 at 14:43 -0700, Scott Garman wrote:
> On 05/24/2012 02:38 PM, Scott Garman wrote:
> > Hello,
> >
> > This is the first pull request for the oe-core denzil branch, based on
> > a set of commits I've been testing from my sgarman/denzil-next branch.
> >
> > These commits have passed an array of build and runtime tests,
> > including the following nightly build:
> 
> I should qualify this by mentioning that the branch that received the 
> testing was my poky-based branch, which does have additional commits.
> 
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
> >

Thanks for putting this together Scott, I've merged it into the main
denzil branch.

Cheers,

Richard



