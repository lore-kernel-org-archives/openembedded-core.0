Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UH9yY-0008GQ-Sv for openembedded-core@lists.openembedded.org;
	Sun, 17 Mar 2013 10:34:26 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2H9Q1Nu012119; Sun, 17 Mar 2013 09:26:01 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Tut-fElFoqHv; Sun, 17 Mar 2013 09:26:01 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r2H9PpQT012112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sun, 17 Mar 2013 09:25:54 GMT
Message-ID: <1363511802.6710.16.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 17 Mar 2013 09:16:42 +0000
In-Reply-To: <FC0195A5-8F7D-4750-95F6-53CEACBDEB31@gmail.com>
References: <1363377280-14797-1-git-send-email-sgw@linux.intel.com>
	<FC0195A5-8F7D-4750-95F6-53CEACBDEB31@gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: Update License Information (remove GPLv3 Licnese)
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
X-List-Received-Date: Sun, 17 Mar 2013 09:34:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-03-16 at 22:03 -0700, Khem Raj wrote:
> On Mar 15, 2013, at 12:54 PM, Saul Wold <sgw@linux.intel.com> wrote:
> 
> > The upstream authors have updated the licenses of a couple subcomponents,
> > these were GPLv3, but updated to be either GPLv2 or LGPLv2.1 accordingly.
> > These changes make the util-linux package become completely non-GPLv3.
> 
> Is it possible to demote license from V3 to V2 like that  I wonder

The maintainer sought out approval from the copyright holders so yes.
The more people who've changed the files in question, the harder it
becomes.

Cheers,

Richard



