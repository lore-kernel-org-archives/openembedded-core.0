Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1QQwum-0000jo-8p
	for openembedded-core@lists.openembedded.org;
	Mon, 30 May 2011 09:29:28 +0200
Received: (qmail 18086 invoked by uid 503); 30 May 2011 08:15:06 -0000
Received: from b6.ovh.net (HELO mail182.ha.ovh.net) (213.186.33.56)
	by 63.mail-out.ovh.net with SMTP; 30 May 2011 08:15:06 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 30 May 2011 09:19:38 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 30 May 2011 09:19:36 +0200
Message-ID: <4DE34507.2090107@eukrea.com>
Date: Mon, 30 May 2011 09:19:35 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc14
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <53EA452E-5E40-471F-8AF7-BE8303945241@dominion.thruhere.net>
In-Reply-To: <53EA452E-5E40-471F-8AF7-BE8303945241@dominion.thruhere.net>
X-Ovh-Tracer-Id: 4974225788907007426
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-Spam-Check: DONE|U 0.5/N
Subject: Re: Any volunteers for fixing all the kernel version checks?
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
X-List-Received-Date: Mon, 30 May 2011 07:29:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 30/05/2011 08:52, Koen Kooi wrote:
> As some of you might have seen already: http://lwn.net/Articles/445223/ - linux 3.0 is going to happen.
>
> This means all the crufty "is it 2.4 or 2.6" checks are going to need a rework :)

Does supporting 2.4 kernels still makes sense in 2011 ?

Eric


