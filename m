Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AE3AE601D3;
	Tue, 15 Dec 2015 17:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFHDbG1006898; Tue, 15 Dec 2015 17:13:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 7mQENDKPZtnd; Tue, 15 Dec 2015 17:13:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	tBFHDQU7006875
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Dec 2015 17:13:32 GMT
Message-ID: <1450199606.13505.79.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Philip Balister <philip@balister.org>, Mariano Lopez
	<mariano.lopez@linux.intel.com>, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>
Date: Tue, 15 Dec 2015 17:13:26 +0000
In-Reply-To: <567044A7.8050505@balister.org>
References: <567039E1.5000205@linux.intel.com> <5670400E.6030201@balister.org>
	<1450197453.13505.72.camel@linuxfoundation.org>
	<567044A7.8050505@balister.org>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Tue, 15 Dec 2015 17:13:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-12-15 at 11:49 -0500, Philip Balister wrote:
> On 12/15/2015 11:37 AM, Richard Purdie wrote:
> > On Tue, 2015-12-15 at 11:30 -0500, Philip Balister wrote:
> > > I also suggest copying the
> > > 
> > > https://lists.yoctoproject.org/listinfo/yocto-security
> > > 
> > > list.
> > 
> > and the architecture list, this is something that should apply to
> > more
> > than OE-Core ideally.
> 
> I thought the exact same thing seconds after hitting send. I'll let
> the
> security and architecture people decide which list is best for
> discussion.
> 
> What I do want to see is fewer discussions cross posted across many
> lists.

Agreed, right now I just want people to get thinking about the right
place for some of these discussions to happen too though.

I suspect the right place is architecture since we're likely going to
want to update the patch submission guidelines and reach a wide
audience with this. I believe Mariano will repost onto the architecture
list and anyone interested can join in there.

Cheers,

Richard







