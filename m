Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id CBDC86B25A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 22:00:46 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7KMCLgH004331; Tue, 20 Aug 2013 23:12:21 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XdzgowzVFFg1; Tue, 20 Aug 2013 23:12:21 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r7KMCIFu004327
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 20 Aug 2013 23:12:19 +0100
Message-ID: <1377036025.25999.106.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 20 Aug 2013 23:00:25 +0100
In-Reply-To: <CAP9ODKrztwFdR7qXzRhXWPbV1=Vsrnor=SAji2Hn3aHwZ7Ayhg@mail.gmail.com>
References: <cover.1377008073.git.sgw@linux.intel.com>
	<1377009976.25999.98.camel@ted>
	<CAP9ODKrztwFdR7qXzRhXWPbV1=Vsrnor=SAji2Hn3aHwZ7Ayhg@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 00/25] Final Review and ACK
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
X-List-Received-Date: Tue, 20 Aug 2013 22:00:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2013-08-20 at 12:06 -0300, Otavio Salvador wrote:
> On Tue, Aug 20, 2013 at 11:46 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Tue, 2013-08-20 at 07:28 -0700, Saul Wold wrote:
> >> Richard,
> >>
> >> This has been ACK'ed by Ross and Paul, I re-ordered the tune file
> >> usage patches and will create a patch to clean up the comment that
> >> Ross mentions.
> >>
> >> I agree with Ross on the texinfo patch, his name is there in the
> >> email.
> >
> > Merged, thanks!
> 
> Thanks for merging the patches but one change, the poky.conf change
> (http://patchwork.openembedded.org/patch/55893/), has not been merged.

It was resent so I discarded the old series from my queue. You then sent
the poky patch to the OE-Core list so every time I searched for it on
the poky list, I didn't find it.

I have now found and applied it but please keep this in mind in future
as its simple things like this that end up delaying things :(

Cheers,

Richard



