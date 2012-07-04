Received: from [78.110.170.148] (helo=tinyArch.localdomain)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SmL7j-0005Rw-V9
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 10:39:47 +0200
Received: from [192.168.0.41] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id 8966E613DC;
	Wed,  4 Jul 2012 09:16:47 +0100 (BST)
Message-ID: <4FF3FEFE.3000103@communistcode.co.uk>
Date: Wed, 04 Jul 2012 09:29:50 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120616 Thunderbird/13.0.1
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4FF320DD.8090301@palm.com> <4FF32E93.9050802@communistcode.co.uk>
	<2056870.tdrijsDPYL@helios>
In-Reply-To: <2056870.tdrijsDPYL@helios>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: local.conf & bblayers.conf changes...
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
X-List-Received-Date: Wed, 04 Jul 2012 08:39:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/07/12 20:22, Paul Eggleton wrote:
> On Tuesday 03 July 2012 18:40:35 Jack Mitchell wrote:
>> What I did was create a new build directory and do a diff between my
>> current config and the newly generated config.
>>
>> I couldn't find the reference local.conf file that bitbake tells you to
>> compare against...
>
> It's in meta(-yocto)/conf/local.conf.sample.
>
> Cheers,
> Paul
>

Indeed it is, I think I was looking in the bitbake directory originally...

I seem to remember the help message being confusing/contradictory but I 
can't find it now.

Cheers,

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--



