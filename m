Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2F40565CB5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 22:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NMMhkh024336; Fri, 23 Sep 2016 23:24:37 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id lu4jOK8VFsa7; Fri, 23 Sep 2016 23:24:37 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8NMOYcs024945
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 23 Sep 2016 23:24:35 +0100
Message-ID: <1474669474.30475.8.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 23:24:34 +0100
In-Reply-To: <82a667ae-827f-3def-d59a-3ac86b406d62@gmail.com>
References: <cover.1474238169.git.akuster@mvista.com>
	<82a667ae-827f-3def-d59a-3ac86b406d62@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: Re: [PATCH 00/13] Jethro-next pull request
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
X-List-Received-Date: Fri, 23 Sep 2016 22:24:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-09-23 at 10:23 -0700, akuster808 wrote:
> On 09/18/2016 03:44 PM, Armin Kuster wrote:
> > 
> > From: Armin Kuster <akuster@mvista.com>
> > 
> > please consider these security and bug fixes for Jethro.
> > 
> > My krogoth-next stagging branch has a complimentary set for the
> > security fixes.
> > 
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akust
> > er/krogoth-next: 7a24bd8a38a2819965b8c1926d33042bd61d1f0b
> > 
> > The following changes since commit
> > 6b732a392289a7bb50b0e3716c066c62fa32a14d:
> > 
> >    curl: security fix for CVE-2016-5420 (2016-09-02 08:48:20 +0100)
> > 
> > are available in the git repository at:
> > 
> >    git://git.openembedded.org/openembedded-core-contrib
> > akuster/jethro-next
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/
> > log/?h=akuster/jethro-next

I've merged in the various jethro bitbake/core fixes, thanks. Sorry
about the delay, I think we're up to date now?

Cheers,

Richard

