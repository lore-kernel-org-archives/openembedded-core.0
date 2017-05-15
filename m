Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6D1EB60110
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 22:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 21A9820B87;
	Mon, 15 May 2017 22:10:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vWU-ut3JEzPJ; Mon, 15 May 2017 22:10:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 00D19204E0;
	Mon, 15 May 2017 22:10:28 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8EB071624C3; Mon, 15 May 2017 18:10:28 -0400 (EDT)
Date: Mon, 15 May 2017 18:10:28 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Mirza Krak <mirza.krak@endian.se>
Message-ID: <20170515221028.GL28053@denix.org>
References: <20170510093705.12171-1-mirza.krak@endian.se>
	<20170510113147.26292.19160@do.openembedded.org>
	<CALw8SCUNKZ039BjF6fHAq8JCtsH-OptJrf+KhPUUsY9LG9vQ6g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALw8SCUNKZ039BjF6fHAq8JCtsH-OptJrf+KhPUUsY9LG9vQ6g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIFttZXRhLW9lLG1vcnR5LDEvMV0gb3BlbnNzbC1uYXRpdmU6IENvbXBpbGUgd2l0aCAtZlBJQw==?=
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
X-List-Received-Date: Mon, 15 May 2017 22:10:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 15, 2017 at 09:05:23AM +0200, Mirza Krak wrote:
> 2017-05-10 13:31 GMT+02:00 Patchwork <patchwork@patchwork.openembedded.org>:
> > == Series Details ==
> >
> > Series: [meta-oe,morty,1/1] openssl-native: Compile with -fPIC
> > Revision: 1
> > URL   : https://patchwork.openembedded.org/series/6671/
> > State : failure
> 
> I seem to have messed up here.
> 
> Why does the testing framework think that I was targeting master? Was
> my subject prefix wrong?

Why is there "meta-oe" in there? This is oe-core, not meta-oe...

-- 
Denys

