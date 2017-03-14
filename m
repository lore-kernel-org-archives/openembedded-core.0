Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4FB7783E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Mar 2017 17:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2EHE32D025753; Tue, 14 Mar 2017 17:14:03 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id bEC80R2eRXHQ; Tue, 14 Mar 2017 17:14:03 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2EHE0I0025750
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 14 Mar 2017 17:14:01 GMT
Message-ID: <1489511640.13980.47.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 14 Mar 2017 17:14:00 +0000
In-Reply-To: <CAP9ODKp5zA3egzti=OfYD7YvpHqhE9n4YOhJagOc4rZurbA85w@mail.gmail.com>
References: <cover.1489144807.git.alexander.kanavin@linux.intel.com>
	<1489504451.13980.41.camel@linuxfoundation.org>
	<CAP9ODKp5zA3egzti=OfYD7YvpHqhE9n4YOhJagOc4rZurbA85w@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/44] Replace Smart package manager with DNF package manager
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
X-List-Received-Date: Tue, 14 Mar 2017 17:14:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-03-14 at 13:48 -0300, Otavio Salvador wrote:
> On Tue, Mar 14, 2017 at 12:14 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
> > 
> > Despite this I merged it on the basis that I'd rather have this in
> > pyro
> > rather than waiting another 6 months to get this in and having to
> > tell
> > people we were changing soon and having to deal with any more smart
> > issues.
> ...
> 
> This kind of change should have been merged in November, not less of
> two months of release. One more time heavy changes been commited late
> on release.

In this case the patches have been talked about and in review on the
mailing list for months so I really don't think anyone can be
surprised. It was also a stated release objective to do something about
smart.

Also, nobody replied to the status reports where I discussed merging or
not merging either so I could only assume nobody had opinions.

Cheers,

Richard


