Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S0EtM-0006y1-Gi for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:18:08 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MG9jWk030757;
	Wed, 22 Feb 2012 16:09:46 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30565-03; Wed, 22 Feb 2012 16:09:41 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1MG9aZ7030751
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 22 Feb 2012 16:09:37 GMT
Message-ID: <1329926977.20261.168.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 22 Feb 2012 16:09:37 +0000
In-Reply-To: <CAP9ODKo_94H_HkxHbvpe-hXpS6t0=5Dqv5QUSHPW+DsYJ=jncA@mail.gmail.com>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<1329923198.20261.160.camel@ted>
	<CAP9ODKp9uc7UajJYHNZ_QJ_R+YOXmPt_ZU2phHWFQvG-2CnOng@mail.gmail.com>
	<2032247.UMYq2ztU6u@helios>
	<CAP9ODKo_94H_HkxHbvpe-hXpS6t0=5Dqv5QUSHPW+DsYJ=jncA@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 16:18:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-02-22 at 13:56 -0200, Otavio Salvador wrote:
> On Wed, Feb 22, 2012 at 13:53, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
> > Except here we are talking about a single patch that adds a single file, which
> > is easily downloadable from the web interface. If it were more complicated I
> > could understand the fuss, but right now this is almost ridiculous.
> 
> It doesn't seem that easy; it seems Koen tried to apply it and it has failed.
> 
> Besides, Robert didn't complain about people asking it to be resend.
> Who is complaining is Richard and I am just justifying the reasoning
> why it is more the logical to expect it to be done based on OE-Core.

In this case, Richard is presenting the viewpoint he's heard expressed
by a number of people in private but who don't want to rock the boat on
the mailing list. I'd like to see the mailing list be a friendly place
where people don't get flamed for posting patches. Some of the recent
responses are less than friendly and I think its reasonable to try and
resolve this.

I'm going to propose that if trees are poky based, the pull request
should indicate this. People can then act accordingly. No indication
means its oe-core derived.

Cheers,

Richard







