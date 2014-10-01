Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 863B86017E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 08:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s918BkDZ014859; Wed, 1 Oct 2014 09:11:46 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6kA12op_6UMa; Wed,  1 Oct 2014 09:11:46 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s918Bhgg014856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 1 Oct 2014 09:11:44 +0100
Message-ID: <1412151136.17658.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 01 Oct 2014 09:12:16 +0100
In-Reply-To: <20141001041020.GC25706@jama>
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
	<CAMKF1sqJ=QsZWNWe436Q6hNaegEm6HMj76JtXU-gZBhrkRutAQ@mail.gmail.com>
	<20141001013231.GQ2480@denix.org>
	<CAMKF1sqa2JtVOhv7f0P=_HfSnrL2kfd2QmP+GM_FsM3zb-xq=g@mail.gmail.com>
	<20141001041020.GC25706@jama>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Wed, 01 Oct 2014 08:12:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2014-10-01 at 06:10 +0200, Martin Jansa wrote:
> On Tue, Sep 30, 2014 at 08:55:53PM -0700, Khem Raj wrote:
> > On Tue, Sep 30, 2014 at 6:32 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > > On Tue, Sep 30, 2014 at 06:25:57PM -0700, Khem Raj wrote:
> > >> On Tue, Sep 30, 2014 at 5:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > >> > This line above ^^^^ has a very long trail of whitespaces and it got commited
> > >> > that way, unfortunately :(
> > >>
> > >> Better was if you commented before it went in.
> > >
> > > And how would you suggest I was supposed to see it?? Nobody saw it. My email
> > > client is no different than others - it doesn't mark trailing whitespaces. The
> > > reason I saw it is because I ran "git log -p" on the file and that explicitly
> > > highlights trailing whitespaces in BRIGHT RED... :)
> > 
> > just for that may be we should start using gerrit ;)
> 
> I'm all for it, it would make my e-mail - review - patchwork -
> master-next workflow a lot easier and reliable.

And I am not. Why? I've actually tried using the thing and I absolutely
*despise* its interface. This isn't just a mild dislike, I simply cannot
do the things I want/need to do with it.

I believe I should have some kind of a say in this since it will
directly affect my workflow and general life (since I spend a lot of my
time dealing with this). Its appears to be very easy for other people to
tell me how I should work though :(.

Cheers,

Richard







