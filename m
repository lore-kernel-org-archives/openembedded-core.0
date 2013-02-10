Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1U4bqL-0000m3-Mz
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Feb 2013 19:41:39 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2013 10:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,639,1355126400"; d="scan'208";a="285490578"
Received: from unknown (HELO envy.home) ([10.255.12.121])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2013 10:25:38 -0800
Message-ID: <5117E622.3080700@linux.intel.com>
Date: Sun, 10 Feb 2013 10:25:38 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130110 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <cover.1360362264.git.dvhart@linux.intel.com>
	<fe2cc60ac93c64b7a6da42f876ff9befd1cf1938.1360362264.git.dvhart@linux.intel.com>
	<CAP9ODKpCZrabQt1s1=GHHhXm9s-GSMDgjq3965w8XQFka8-8ug@mail.gmail.com>
	<51168084.3080902@linux.intel.com>
	<CAP9ODKq0q-DXgeeehtJE_jJbMcNUuNhn5gzFR3m11e2Lmhp+mw@mail.gmail.com>
	<CADkTA4PvLPB9C_ornX0EAXVEQVRSX4v0VZbOfz=zTtgHai-O0A@mail.gmail.com>
In-Reply-To: <CADkTA4PvLPB9C_ornX0EAXVEQVRSX4v0VZbOfz=zTtgHai-O0A@mail.gmail.com>
X-Enigmail-Version: 1.5
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Poky <poky@yoctoproject.org>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/7] oe-git-proxy: Add a new comprehensive git proxy script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 10 Feb 2013 18:41:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 02/09/2013 06:48 PM, Bruce Ashfield wrote:

>     >> All those comments ought to be bellow --- or those will be included in
>     >> commit log.
>     >>
>     >
>     > Which is fine.
> 
>     Well, usually the log of the revisions are not included in the commit
>     logs; any special reason for it to be done different?
> 
> 
> Randomly jumping in,
> 
> It's not all that uncommon for kernel developers to keep the revision
> history
> in long logs. It's used as a way to track the intermediate history, give 
> review credit .. or just "because".
> 
> So while not always done, it isn't unheard of. I have no strong opinion one
> way or the other, just thought I'd throw that out!

I'll just leave that to the maintainer. If whoever pushes it objects,
they can drop it, or ask me to resend.


-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Technical Lead - Linux Kernel


